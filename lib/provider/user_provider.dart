import 'package:flutter/material.dart';

import '../Data/models/user_model.dart';
import '../Data/services/firebase_service.dart';

class UsersProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsFavorite(String eventId) {
    return currentUser!.favoriteEventsId.contains(eventId);
  }

  void addToFavorites(String eventId) async {
    FirebaseService.addEventToFavorite(eventId);
    currentUser!.favoriteEventsId.add(eventId);
    notifyListeners();
  }

  void removeFromFavorites(String eventId) async {
    FirebaseService.removeEventFromFavorite(eventId);
    currentUser!.favoriteEventsId.remove(eventId);
    notifyListeners();
  }
}
