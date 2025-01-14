import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: SafeArea(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
