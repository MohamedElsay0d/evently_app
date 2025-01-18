import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/app_theme.dart';

class DetectLocation extends StatelessWidget {
  const DetectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryColor, width: 1),
      ),
      child: ListTile(
        leading: SvgPicture.asset('assets/icons/location.svg'),
        title: Text(
          'Detect Location',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: AppTheme.primaryColor,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
