import 'package:flutter/material.dart';
import 'package:tobo_apk/model/jasa_model.dart';

class JasaContentProv extends ChangeNotifier {
  final List<JasaModel> _jasaList = [
    // ================= INTERIOR =================
    JasaModel(
      id: '1',
      title: 'Desain Interior',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa.png',
      category: 'Interior',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Desain Interior',
    ),
    JasaModel(
      id: '2',
      title: 'Renovasi Interior',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa2.png',
      category: 'Interior',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Renovasi Interior',
    ),
    JasaModel(
      id: '3',
      title: 'Custom Furniture',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Interior',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),
    JasaModel(
      id: '4',
      title: 'Custom Furniture',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Interior',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),
    JasaModel(
      id: '5',
      title: 'Custom Furniture',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Interior',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),

    // ================= KONSTRUKSI =================
    JasaModel(
      id: '6',
      title: 'Paving Block',
      description: 'Pengerjaan konstruksi ringan untuk rumah dan bangunan.',
      image: 'assets/images/jasa.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Konstruksi Ringan',
    ),
    JasaModel(
      id: '7',
      title: 'Pagar',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Desain Interior',
    ),
    JasaModel(
      id: '8',
      title: 'Renovasi Interior',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa2.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Renovasi Interior',
    ),
    JasaModel(
      id: '9',
      title: 'Renovasi Toilet',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),
    JasaModel(
      id: '10',
      title: 'Renovasi Toilet',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),
    JasaModel(
      id: '11',
      title: 'Renovasi Toilet',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sadsadsasadddasdassadasdsad.',
      image: 'assets/images/jasa3.png',
      category: 'Konstruksi',
      whatsappMessage: 'Halo, saya tertarik dengan jasa Custom Furniture',
    ),
  ];

  final PageController pageController = PageController();

  int _selectedTab = 0; // 0 = Interior, 1 = Konstruksi Ringan

  int get selectedTab => _selectedTab;

  /// 🔥 DIPANGGIL SAAT TAP TAB
  void changeTab(int index) {
    if (_selectedTab == index) return;

    _selectedTab = index;
    notifyListeners();

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// 🔥 DIPANGGIL SAAT SWIPE
  void onPageChanged(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  List<JasaModel> get filteredJasa {
    if (_selectedTab == 0) {
      return _jasaList.where((e) => e.category == 'Interior').toList();
    } else {
      return _jasaList.where((e) => e.category == 'Konstruksi').toList();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
