import 'package:flutter/material.dart';

import '../../../../Data/models/category_model.dart';
import '../../../../themes/app_theme.dart';

class TabBarItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const TabBarItem({super.key, required this.category , this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected ? AppTheme.white : Colors.transparent,
        border: Border.all(color: AppTheme.white, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? AppTheme.primaryColor : AppTheme.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: isSelected ? AppTheme.primaryColor : AppTheme.white),
          )
        ],
      ),
    );
  }
}
