import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/services/firebase_service.dart';
import '../../../../../provider/settings_provider.dart';
import '../../../../../provider/user_provider.dart';
import '../../../auth/login_screen.dart';
import '../../../auth/widgets/button_with_image.dart';
import '../../widgets/container_header.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  final Map<String, String> languageCodes = const {
    'en': 'English',
    'ar': 'العربية',
  };

  @override
  Widget build(BuildContext context) {
    final Settingsrovider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        ContainerHeader(isProfile: true),
        SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Theme',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  Switch(
                      value: Settingsrovider.getIsDark,
                      onChanged: (value) {
                        Settingsrovider.changeTheme();
                      }),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      underline: SizedBox(),
                      borderRadius: BorderRadius.circular(16),
                      items: languageCodes.entries
                          .map(
                            (entry) => DropdownMenuItem<String>(
                              value: entry.key,
                              child: Text(entry.value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          Settingsrovider.changeLanguage(value);
                        }
                      },
                      value: languageCodes.entries
                          .firstWhere((entry) =>
                              entry.key == Settingsrovider.languageCode)
                          .key,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ButtonWithImage(
            icon: 'exit',
            onPressed: () {
              FirebaseService.logout();
              Provider.of<UsersProvider>(context, listen: false)
                  .updateUser(null);
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          ),
        ),
        SizedBox(height: 35),
      ],
    );
  }
}
