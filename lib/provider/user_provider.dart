import 'package:flutter/material.dart';

import '../Data/models/user_model.dart';

class UsersProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

}
