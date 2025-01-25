import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Data/models/event_model.dart';
import '../../../../../Data/services/firebase_service.dart';
import '../../../../../provider/event_provider.dart';
import '../../widgets/container_header.dart';
import '../../widgets/event_item.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  List<EventModel> events = [];
  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      getEvents();
    }
    return Column(
      children: [
        ContainerHeader(),
        Expanded(
          child: Consumer<EventsProvider>(
            builder: (context, eventsProvider, child) {
              if (eventsProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (eventsProvider.events.isEmpty) {
                return Center(child: Text('No events available'));
              } else {
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  itemCount: eventsProvider.events.length,
                  itemBuilder: (context, index) {
                    return EventItem(
                      event: eventsProvider.events[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> getEvents() async {
    events = await FirebaseService.getEventsFromFirebase();
    setState(() {});
  }
}
