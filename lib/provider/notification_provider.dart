import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final List<bool> _tappedList = List.generate(5, (_) => false);

  bool isTapped(int index) => _tappedList[index];

  void toggleTapped(int index) {
    _tappedList[index] = !_tappedList[index];
    notifyListeners();
  }
}
