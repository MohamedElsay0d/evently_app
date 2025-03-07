import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Data/models/category_model.dart';
import '../../../Data/models/event_model.dart';
import '../../../provider/event_provider.dart';
import '../../../provider/user_provider.dart';
import '../../../themes/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../homepage/widgets/tab_bar_item.dart';
import 'widgets/custom_row.dart';
import 'widgets/detect_location.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = '/create_event';
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final formKey = GlobalKey<FormState>();

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
          AppLocalizations.of(context)!.createEvent,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                        'assets/images/${Category.items[selectedIndex].image}.png'),
                  ),
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
                            label: category.name,
                            icon: category.icon,
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
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                          CustomTextFormField(
                            hintText: AppLocalizations.of(context)!.hintTitle,
                            icon: 'event_title',
                            controller: titleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter event title';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                          CustomTextFormField(
                            hintText:
                                AppLocalizations.of(context)!.hintDescription,
                            controller: descriptionController,
                            maxLines: 5,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter event description';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    CustomRow(
                      title: AppLocalizations.of(context)!.eventDate,
                      selectedDate: selectedDate,
                      selectedTime: null,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      onTimeSelected: (time) {},
                    ),
                    CustomRow(
                      title: AppLocalizations.of(context)!.eventTime,
                      selectedDate: null,
                      selectedTime: selectedTime,
                      onDateSelected: (date) {},
                      onTimeSelected: (time) {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    DetectLocationTime(
                      title: AppLocalizations.of(context)!.hintLocation,
                      image: 'location',
                    ),
                    SizedBox(height: 12),
                    CustomButton(
                      label: AppLocalizations.of(context)!.createEvent,
                      onPress: () async {
                        if (formKey.currentState!.validate() &&
                            selectedDate != null &&
                            selectedTime != null) {
                          EventModel event = EventModel(
                            title: titleController.text,
                            userId: Provider.of<UsersProvider>(context,
                                    listen: false)
                                .currentUser!
                                .id,
                            description: descriptionController.text,
                            date: selectedDate!,
                            time: selectedTime!,
                            category: Category.items[selectedIndex],
                          );
                          Provider.of<EventsProvider>(context, listen: false)
                              .addEvent(event);
                          Navigator.pop(context);
                        }
                      },
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
