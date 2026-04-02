import 'package:flutter/material.dart';
import '../models/user_role.dart';

class UserProvider extends ChangeNotifier {
  // Start with a default role for testing
  UserRole _role = UserRole.observer;

  UserRole get role => _role;

  // Call this to switch roles during testing
  void setRole(UserRole newRole) {
    _role = newRole;
    notifyListeners();
  }
}