import 'package:flutter/material.dart';
import '../models/user_role.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<String> _routes = [];

  List<String> get routes => _routes;

  void configureRoutes(UserRole? role) {
    if (role == UserRole.admin) {
      _routes = [
        '/admin/dashboard',
        '/admin/users',
        '/admin/system',
        '/profile',
      ];
    } else {
      // default (observer + field manager + guest)
      _routes = [
        '/home',
        '/viewreports',
        '/predictions',
        '/profile',
      ];
    }

    _currentIndex = 0;
    notifyListeners();
  }

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void setRoute(String route) {
    final index = _routes.indexWhere((r) => route.startsWith(r));
    if (index != -1 && index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}