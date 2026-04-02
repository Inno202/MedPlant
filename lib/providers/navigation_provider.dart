import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  final List<String> routes = [
    '/home',
    '/viewreports',
    '/predictions',
    '/profile',
  ];

  int get currentIndex => _currentIndex;
  String get currentRoute => routes[_currentIndex];

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void setRoute(String route) {
  final index = routes.indexWhere((r) => route.startsWith(r));
  if (index != -1 && index != _currentIndex) { // only notify if different
    _currentIndex = index;
    notifyListeners(); // this only triggers rebuild when needed
  }
}
}