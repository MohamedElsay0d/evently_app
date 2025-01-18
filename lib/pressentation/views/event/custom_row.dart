import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/app_theme.dart';

class CustomRow extends StatelessWidget {
  final String title;
  const CustomRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/${title.toLowerCase()}.svg',
        ),
        SizedBox(width: 5),
        Text(
          'Event $title',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Choose $title',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
