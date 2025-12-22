import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobo_apk/model/katalog_model.dart';

class KatalogProvider extends ChangeNotifier {
  KatalogTab _activeTab = KatalogTab.semua;
  List<KatalogModel> _allItems = [];

  // ✅ Panggil loadData saat Provider diinisialisasi
  KatalogProvider() {
    loadData();
  }

  KatalogTab get activeTab => _activeTab;

  List<KatalogModel> get filteredItems {
    if (_activeTab == KatalogTab.semua) {
      return _allItems;
    }

    return _allItems.where((item) {
      switch (_activeTab) {
        case KatalogTab.wallpaper:
          return item.id.startsWith('w');
        case KatalogTab.hpl:
          return item.id.startsWith('h');
        case KatalogTab.panel:
          return item.id.startsWith('p');
        default:
          return true;
      }
    }).toList();
  }

  Future<void> loadData() async {
    final jsonStr = await rootBundle.loadString(
      'assets/data/katalog.json',
    );
    final List data = json.decode(jsonStr);

    _allItems = data.map((e) => KatalogModel.fromJson(e)).toList();
    notifyListeners();
  }

  void changeTab(KatalogTab tab) {
    _activeTab = tab;
    notifyListeners();
  }

  // ✅ Helper untuk mengubah tab berdasarkan index (untuk UI)
  void changeTabByIndex(int index) {
    switch (index) {
      case 0:
        changeTab(KatalogTab.semua);
        break;
      case 1:
        changeTab(KatalogTab.wallpaper);
        break;
      case 2:
        changeTab(KatalogTab.hpl);
        break;
      case 3:
        changeTab(KatalogTab.panel);
        break;
    }
  }
}

enum KatalogTab {
  semua,
  wallpaper,
  hpl,
  panel,
}
