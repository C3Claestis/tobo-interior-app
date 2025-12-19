import 'dart:async';
import 'package:flutter/material.dart';

class PromoBannerProv extends ChangeNotifier {
  final PageController pageController = PageController();
  Timer? _timer;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<String> bannerImages = [
    "assets/images/promo1.png",
    "assets/images/promo2.png",
    "assets/images/promo3.png",
  ];

  PromoBannerProv() {
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _currentIndex =
          (_currentIndex + 1) % bannerImages.length;

      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

      notifyListeners();
    });
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
