import 'package:flutter/material.dart';

class BeforeAfterSliderProv extends ChangeNotifier {
  double _dragPosition = 0.5;

  double get dragPosition => _dragPosition;

  void updateDrag(double delta, double width) {
    _dragPosition += delta / width;
    _dragPosition = _dragPosition.clamp(0.0, 1.0);
    notifyListeners();
  }
}
