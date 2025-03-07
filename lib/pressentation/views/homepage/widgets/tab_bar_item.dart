import 'package:flutter/material.dart';
import '../../../../themes/app_theme.dart';

class TabBarItem extends StatelessWidget {
  final bool isSelected;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color selectedBackgroundColor;
  final Color selectedForegroundColor;
  final String label ;
  final IconData icon;
  const TabBarItem({
    super.key,
    this.isSelected = false,
    this.backgroundColor = AppTheme.white,
    this.foregroundColor = AppTheme.primaryColor,
    this.selectedBackgroundColor = AppTheme.white,
    this.selectedForegroundColor = AppTheme.primaryColor,
    required this.label ,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected ? selectedBackgroundColor : backgroundColor,
        border: Border.all(color: foregroundColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? selectedForegroundColor : foregroundColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected ? selectedForegroundColor : foregroundColor,
                ),
          )
        ],
      ),
    );
  }
}
