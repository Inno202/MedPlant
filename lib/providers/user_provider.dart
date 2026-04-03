import 'package:flutter/material.dart';
import '../models/user_role.dart';

class UserProvider extends ChangeNotifier {
  UserRole? _role; // null = not logged in
  bool _isLoggedIn = false;

  UserRole? get role => _role;
  bool get isLoggedIn => _isLoggedIn;

  // 🔐 LOGIN
  void login(UserRole role) {
    _role = role;
    _isLoggedIn = true;

    debugPrint("User logged in as: ${role.name}");

    notifyListeners();
  }

  // 🔓 LOGOUT
  void logout() {
    debugPrint("User logged out");

    _role = null;
    _isLoggedIn = false;

    notifyListeners();
  }

  // 🔄 TEMP: switch role while logged in (for testing)
  void switchRole(UserRole newRole) {
    if (!_isLoggedIn) return;

    _role = newRole;

    debugPrint("Role switched to: ${newRole.name}");

    notifyListeners();
  }

    void setRole(UserRole? newRole) {
    _role = newRole;
    notifyListeners();
  }
}