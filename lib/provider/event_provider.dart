import 'package:flutter/material.dart';

import '../Data/models/event_model.dart';
import '../Data/services/firebase_service.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> events = [];
  bool isLoading = false;

  EventsProvider() {
    getAllEVents();
  }

  void getAllEVents() async {
    isLoading = true;
    notifyListeners();
    events = await FirebaseService.getEventsFromFirebase();
    isLoading = false;
    notifyListeners();
  }

  void addEvent(EventModel event) async{
    await FirebaseService.addEventToFirebase(event);
    getAllEVents();
  }
}
