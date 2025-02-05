import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'pressentation/views/auth/forget_password_screen.dart';
import 'pressentation/views/auth/login_screen.dart';
import 'pressentation/views/auth/register_screen.dart';
import 'pressentation/views/event/create_event.dart';
import 'pressentation/views/event/event_details.dart';
import 'pressentation/views/homepage/home_page.dart';
import 'provider/event_provider.dart';
import 'provider/settings_provider.dart';
import 'provider/user_provider.dart';
import 'themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => EventsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UsersProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
      )
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
        
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await settingsProvider.initSharedPreference();
      if (settingsProvider.darkTheme != ThemeMode.system ||
          settingsProvider.languageCode != 'en') {
        settingsProvider.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainApp(),
          ),
        );
      }
    });

    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          themeMode: Provider.of<SettingsProvider>(context).darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(Provider.of<SettingsProvider>(context).languageCode),
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen(),
            HomePage.routeName: (context) => const HomePage(),
            CreateEvent.routeName: (context) => const CreateEvent(),
            EventDetails.routeName: (context) => EventDetails(),
          },
        );
      },
    );
  }
}
