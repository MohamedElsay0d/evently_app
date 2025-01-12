import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;
  const CustomButton({super.key, required this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        label,
        style: AppTheme.lightTheme.textTheme.titleLarge,
      ),
    );
  }
}
