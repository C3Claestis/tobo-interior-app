import 'package:flutter/material.dart';

class ToggleTextProv extends ChangeNotifier {
  int selectedIndex = 0;

  void select(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
