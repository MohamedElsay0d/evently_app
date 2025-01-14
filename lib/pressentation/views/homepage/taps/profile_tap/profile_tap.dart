import 'package:flutter/material.dart';

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
          ),
        ),
        SizedBox(height: 35),
      ],
    );
  }
}
