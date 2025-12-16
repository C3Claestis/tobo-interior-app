import 'dart:math';

import 'package:flutter/material.dart';

class RandomImageProvider extends ChangeNotifier {  

  String _imageUrl = generateUrl();

  static String generateUrl() {
    final seed = Random().nextInt(1000);
    return 'https://picsum.photos/seed/$seed/300/300';
  }

  String get imageUrl => _imageUrl;

  void updateImageUrl() {
    _imageUrl = generateUrl();
    notifyListeners();
  }
}