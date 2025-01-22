import 'package:flutter/material.dart';

import '../../../../../Data/models/event_model.dart';
import '../../../../../Data/services/firebase_service.dart';
import '../../widgets/container_header.dart';
import '../../widgets/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerHeader(),
        Expanded(
          child: FutureBuilder<List<EventModel>>(
            future: FirebaseService.getEventsFromFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error fetching events ${snapshot.error}'),
                );
              }
              final events = snapshot.data!;
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventItem(
                    event: events[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
