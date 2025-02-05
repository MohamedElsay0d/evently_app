import 'package:evently_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonWithImage extends StatelessWidget {
  final String icon;
  final Function()? onPressed;
  ButtonWithImage({super.key, required this.icon , this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: icon == 'google'
            ? Theme.of(context).scaffoldBackgroundColor
            : AppTheme.red,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: .8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: icon == 'google'
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/$icon.svg',
            height: 26,
            width: 26,
            color: icon == 'google' ? null : AppTheme.white,
          ),
          const SizedBox(width: 10),
          Text(
            icon == 'google' ? AppLocalizations.of(context)!.loginWithGoogle : AppLocalizations.of(context)!.logout,
            style: icon == 'google'
                ? Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w300,
                    )
                : Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
