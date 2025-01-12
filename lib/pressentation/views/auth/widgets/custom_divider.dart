import 'package:flutter/material.dart';

import '../../../../themes/app_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                );
  }
}