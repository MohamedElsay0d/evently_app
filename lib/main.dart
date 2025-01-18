import 'package:evently_app/pressentation/views/auth/forget_password_screen.dart';
import 'package:flutter/material.dart';

import 'pressentation/views/auth/login_screen.dart';
import 'pressentation/views/auth/register_screen.dart';
import 'pressentation/views/event/create_event.dart';
import 'pressentation/views/homepage/home_page.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ForgetPasswordScreen.routeName : (context) => const ForgetPasswordScreen(),
        HomePage.routeName: (context) => const HomePage(),
        CreateEvent.routeName: (context) => const CreateEvent(),
      },
    );
  }
}
