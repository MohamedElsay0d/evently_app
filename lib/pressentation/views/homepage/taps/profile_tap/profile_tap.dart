import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/services/firebase_service.dart';
import '../../../../../provider/user_provider.dart';
import '../../../auth/login_screen.dart';
import '../../../auth/widgets/button_with_image.dart';
import '../../widgets/container_header.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerHeader(isProfile: true),
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
