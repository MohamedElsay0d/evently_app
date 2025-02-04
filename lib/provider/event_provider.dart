import 'package:flutter/material.dart';

import '../Data/models/category_model.dart';
import '../Data/models/event_model.dart';
import '../Data/services/firebase_service.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> events = [];
  List<EventModel> favoriteEvents = [];
  bool isLoading = false;
  Category? selectedCategory;

  EventsProvider() {
    getAllEVents();
  }

  Future<void> getAllEVents() async {
    isLoading = true;
    notifyListeners();
    events = await FirebaseService.getEventsFromFirebase(selectedCategory?.id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addEvent(EventModel event) async {
    await FirebaseService.addEventToFirebase(event);
    getAllEVents();
  }

  void changeSelectedCategory(Category? category) {
    selectedCategory = category;
    getAllEVents();
  }

  Future<void> deleteEvent(EventModel event) async {
    await FirebaseService.deleteEventFromFirebase(event);
    getAllEVents();
  }

  Future<void> updateEvent(EventModel event) async {
    await FirebaseService.updateEventToFirebase(event);
    getAllEVents();
  }

  Future<void> getFavoriteEvents(List<String> favoriteIds) async {
    isLoading = true;
    favoriteEvents = events.where((event) => favoriteIds.contains(event.id)).toList();
    isLoading = false;
    // notifyListeners();
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