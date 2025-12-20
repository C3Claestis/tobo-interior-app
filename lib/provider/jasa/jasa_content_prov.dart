import 'package:flutter/material.dart';
import 'package:tobo_apk/model/jasa_model.dart';

class JasaContentProv extends ChangeNotifier {
  final List<JasaModel> _jasaList = [
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
  ];

  int _selectedTab = 0; // 0 = Interior, 1 = Konstruksi Ringan

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
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
}
