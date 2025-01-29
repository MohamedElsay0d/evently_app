import 'dart:developer';

import 'package:evently_app/pressentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/event_provider.dart';
import '../../../../../provider/user_provider.dart';
import '../../widgets/event_item.dart';

class LoveTap extends StatelessWidget {
  const LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    List<String> favoriteEvents =
        Provider.of<UsersProvider>(context).currentUser!.favoriteEventsId;
    eventsProvider.getFavoriteEvents(favoriteEvents);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SafeArea(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Search for Event',
              icon: 'search',
              onChanged: (value) {
                log(value);
              },
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: eventsProvider.favoriteEvents.length,
                itemBuilder: (context, index) {
                  return EventItem(
                    event: eventsProvider.favoriteEvents[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
              ),
          ],
        ),
      ),
    );
  }
}
