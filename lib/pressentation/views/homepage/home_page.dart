import 'package:evently_app/pressentation/views/homepage/widgets/navbar_icon.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import 'taps/home_tap/home_tap.dart';
import 'taps/love_tap/love_tap.dart';
import 'taps/map_tap/map_tap.dart';
import 'taps/profile_tap/profile_tap.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const HomeTap(),
    const MapTap(),
    const LoveTap(),
    const ProfileTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: AppTheme.primaryColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: NavBarIcon(
                icon: 'home',
              ),
              activeIcon: NavBarIcon(
                icon: 'homeActive',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(
                icon: 'map',
              ),
              activeIcon: NavBarIcon(
                icon: 'mapActive',
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(
                icon: 'love',
              ),
              activeIcon: NavBarIcon(
                icon: 'loveActive',
              ),
              label: 'Love',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(
                icon: 'profile',
              ),
              activeIcon: NavBarIcon(
                icon: 'profileActive',
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
