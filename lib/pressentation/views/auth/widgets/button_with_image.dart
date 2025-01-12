import 'package:evently_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWithImage extends StatelessWidget {
  const ButtonWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: .8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/google.svg',
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 10),
          Text(
            "Login With Google",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
