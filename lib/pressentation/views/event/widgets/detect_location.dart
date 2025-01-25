import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../themes/app_theme.dart';

class DetectLocationTime extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  const DetectLocationTime(
      {super.key, required this.title, this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryColor, width: 1),
      ),
      child: ListTile(
        leading: SvgPicture.asset('assets/icons/$image.svg'),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
        ),
        subtitle: subtitle != null
            ? Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge)
            : null,
        trailing: subtitle != null
            ? null
            : Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.primaryColor,
              ),
      ),
    );
  }
}
