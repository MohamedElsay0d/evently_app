import 'package:evently_app/pressentation/views/homepage/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

import '../../../../Data/models/category_model.dart';
import '../../../../Data/models/user_info.dart';
import '../../../../themes/app_theme.dart';

class ContainerHeader extends StatefulWidget {
  ContainerHeader({super.key});

  @override
  State<ContainerHeader> createState() => _ContainerHeaderState();
}

class _ContainerHeaderState extends State<ContainerHeader> {
  final User user = User(
    id: '1',
    name: 'Mohamed ElSayed',
    email: 'mohamed@gmail.com',
    phone: '01203654153',
    image: 'image',
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
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
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
              length: Category.items.length,
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
                tabs: Category.items
                    .map(
                      (category) => TabBarItem(
                        category: category,
                        isSelected:
                            selectedIndex == Category.items.indexOf(category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
