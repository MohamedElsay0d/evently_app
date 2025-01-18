import 'package:evently_app/pressentation/views/event/detect_location.dart';
import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Data/models/category_model.dart';
import '../../../themes/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../homepage/widgets/tab_bar_item.dart';
import 'custom_row.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = '/create_event';
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.primaryColor,
          ),
        ),
        title: Text(
          'Create Event',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                      'assets/images/${Category.items[selectedIndex].image}.png'),
                ),
                SizedBox(height: 16),
                DefaultTabController(
                  length: Category.items.length,
                  initialIndex: selectedIndex,
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
                            isSelected: selectedIndex ==
                                Category.items.indexOf(category),
                            backgroundColor: AppTheme.white,
                            foregroundColor: AppTheme.primaryColor,
                            selectedBackgroundColor: AppTheme.primaryColor,
                            selectedForegroundColor: AppTheme.white,
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    CustomTextFormField(
                      hintText: 'Event Title',
                      icon: 'event_title',
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    CustomTextFormField(
                      hintText: 'Event Description',
                    ),
                    CustomRow(title: 'Date'),
                    CustomRow(title: 'Time'),
                    Text(
                      'Location',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    DetectLocation(),
                    SizedBox(height: 12),
                    CustomButton(
                      label: 'Create Event',
                      onPress: () {},
                    ),
                    SizedBox(height: 12),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
