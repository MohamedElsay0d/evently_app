import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcon extends StatelessWidget {
  final icon;
  const NavBarIcon({super.key , required this.icon});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
              'assets/icons/$icon.svg',
              height: 24,
              width: 24,
    );
  }
}