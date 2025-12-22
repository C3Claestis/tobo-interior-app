import 'package:flutter/material.dart';

class KatalogCategoryProv extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
