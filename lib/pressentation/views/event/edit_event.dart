import 'package:evently_app/pressentation/views/event/event_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Data/models/category_model.dart';
import '../../../Data/models/event_model.dart';
import '../../../provider/event_provider.dart';
import '../../../themes/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../homepage/widgets/tab_bar_item.dart';
import 'widgets/custom_row.dart';
import 'widgets/detect_location.dart';

class EditEvent extends StatefulWidget {
  static const String routeName = '/edit_event';
  final EventModel event;
  const EditEvent(this.event, {super.key});

  @override
  State<EditEvent> createState() => _EditEventState(event);
}

class _EditEventState extends State<EditEvent> {
  _EditEventState(this.event);
  EventModel event;
  late int selectedIndex;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  void initState() {
    super.initState();
    selectedIndex = Category.items.indexOf(widget.event.category);
    selectedDate = widget.event.date;
    selectedTime = widget.event.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                        setState(() {
                          selectedIndex = index;
                        });
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
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.normal),
                            ),
                            CustomTextFormField(
                              hintText: widget.event.title,
                              icon: 'event_title',
                              controller: titleController,
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
                              hintText: widget.event.description,
                              controller: descriptionController,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      CustomRow(
                        title: 'Date',
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
                        title: 'Time',
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
                        'Location',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                      DetectLocationTime(
                        title: 'Select Location',
                        image: 'location',
                      ),
                      SizedBox(height: 12),
                      CustomButton(
                        label: 'Update Event',
                        onPress: () async {
                          if (formKey.currentState!.validate() &&
                              selectedDate != null &&
                              selectedTime != null) {
                            EventModel updateEvent = EventModel(
                              id: widget.event.id,
                              userId: widget.event.userId,
                              title: titleController.text.isEmpty
                                  ? widget.event.title
                                  : titleController.text,
                              description: descriptionController.text.isEmpty
                                  ? widget.event.description
                                  : descriptionController.text,
                              date: selectedDate!,
                              time: selectedTime!,
                              category: Category.items[selectedIndex],
                            );
                            Provider.of<EventsProvider>(context, listen: false)
                                .updateEvent(updateEvent);
                            Navigator.pushReplacementNamed(
                                context, EventDetails.routeName,
                                arguments: updateEvent);
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
        ));
  }
}
