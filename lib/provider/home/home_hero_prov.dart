import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tobo_apk/model/hero_banner_model%20.dart';

class HomeHeroProv extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int currentIndex = 0;
  Timer? _timer;

  final double itemWidth = 302; // 290 + spacing

  final List<HeroBannerModel> banners = [
    HeroBannerModel(
      image: 'assets/images/heroimg.png',
      title: 'Interior & Konstruksi Ringan Terpercaya',
      description: 'Desain rapi, material terjamin.',
      buttonTextLeft: 'Konsultasi Interior',
      buttonTextRight: 'Konstruksi Ringan',
    ),
    HeroBannerModel(
      image: 'assets/images/heroimg.png',
      title: 'Interior & Konstruksi Ringan Terpercaya',
      description: 'Desain rapi, material terjamin.',
      buttonTextLeft: 'Konsultasi Interior',
      buttonTextRight: 'Konstruksi Ringan',
    ),
    HeroBannerModel(
      image: 'assets/images/heroimg.png',
      title: 'Interior & Konstruksi Ringan Terpercaya',
      description: 'Desain rapi, material terjamin.',
      buttonTextLeft: 'Konsultasi Interior',
      buttonTextRight: 'Konstruksi Ringan',
    ),
  ];

  HomeHeroProv() {
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      currentIndex = (currentIndex + 1) % banners.length;

      scrollController.animateTo(
        currentIndex * itemWidth,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      notifyListeners();
    });
  }

  void onScroll() {
    final index = (scrollController.offset / itemWidth).round();
    if (index != currentIndex) {
      currentIndex = index;
      notifyListeners();
    }
  }

  void onBannerTap(int index) {
    debugPrint('Banner tapped: ${banners[index].title}');
  }

  @override
  void dispose() {
    _timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }
}
