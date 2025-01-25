import 'package:flutter/material.dart';

import '../Data/models/category_model.dart';
import '../Data/models/event_model.dart';
import '../Data/services/firebase_service.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> events = [];
  bool isLoading = false;
  Category? selectedCategory;

  EventsProvider() {
    getAllEVents();
  }

  void getAllEVents() async {
    isLoading = true;
    notifyListeners();
    events = await FirebaseService.getEventsFromFirebase(selectedCategory?.id);
    isLoading = false;
    notifyListeners();
  }

  void addEvent(EventModel event) async {
    await FirebaseService.addEventToFirebase(event);
    getAllEVents();
  }

  void changeSelectedCategory(Category? category) {
    selectedCategory = category;
    getAllEVents();
  }

  void deleteEvent(EventModel event) async {
    await FirebaseService.deleteEventFromFirebase(event);
    getAllEVents();
  }


  
}




//------------------------- filtering in client side ----------------------------

  /*
  List<EventModel> filterdEvents = [];
  Future<void> getEventsToFilter() async{
    events = await FirebaseService.getEventsFromFirebase(null);
    filterEvents(selectedCategory);
  }
  void filterEvents(Category? category) {
    selectedCategory = category;
    if(category == null){
      filterdEvents = events;
    }else{
      filterdEvents = events.where((element) => element == category).toList();
    }
    notifyListeners();
  }
  */