import 'package:evently_app/pressentation/views/homepage/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

import '../../../../Data/models/category_model.dart';
import '../../../../Data/models/user_info.dart';
import '../../../../themes/app_theme.dart';

class ContainerHeader extends StatefulWidget {
  final bool isProfile;
  const ContainerHeader({super.key, this.isProfile = false});

  @override
  State<ContainerHeader> createState() => _ContainerHeaderState();
}

class _ContainerHeaderState extends State<ContainerHeader> {
  final User user = User(
    id: '1',
    name: 'Mohamed ElSayed',
    email: 'mohamedelsayed@gmail.com',
    phone: '01203654153',
    image: 'route',
  );
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
          child: !(widget.isProfile)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back ✨',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppTheme.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      user.name,
                      style: textTheme.titleLarge,
                    ),
                    SizedBox(height: 28),
                    DefaultTabController(
                      initialIndex: selectedIndex,
                      length: Category.items.length + 1,
                      child: TabBar(
                          indicator: BoxDecoration(),
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(right: 16),
                          onTap: (index) {
                            selectedIndex = index;
                            setState(() {});
                          },
                          tabs: [
                            TabBarItem(
                              label: 'All',
                              icon: Icons.grid_view_rounded,
                              isSelected: selectedIndex == 0,
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: AppTheme.white,
                              selectedBackgroundColor: AppTheme.white,
                              selectedForegroundColor: AppTheme.primaryColor,
                            ),
                            ...Category.items.map(
                              (category) => TabBarItem(
                                label: category.name,
                                icon: category.icon,
                                isSelected: selectedIndex ==
                                    Category.items.indexOf(category) + 1,
                                backgroundColor: AppTheme.primaryColor,
                                foregroundColor: AppTheme.white,
                                selectedBackgroundColor: AppTheme.white,
                                selectedForegroundColor: AppTheme.primaryColor,
                              ),
                            )
                          ]),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/${user.image}.png',
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                user.email,
                                style: textTheme.bodyLarge
                                    ?.copyWith(color: AppTheme.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
    );
  }
}
