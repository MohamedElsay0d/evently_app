import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;
  final bool isLoading ;
  const CustomButton({super.key, required this.label, this.onPress , this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: isLoading ? const CircularProgressIndicator(color: Colors.white,) :
      Text(
        label,
        style: AppTheme.lightTheme.textTheme.titleLarge,
      ),
    );
  }
}
