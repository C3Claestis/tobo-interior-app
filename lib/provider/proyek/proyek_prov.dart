import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobo_apk/model/proyek_model.dart';

class ProyekProvider extends ChangeNotifier {
  ProyekTab _activeTab = ProyekTab.semua;
  List<ProyekModel> _allItems = [];

  // ✅ Panggil loadData saat Provider diinisialisasi
  ProyekProvider() {
    loadData();
  }

  ProyekTab get activeTab => _activeTab;

  List<ProyekModel> get filteredItems {
    if (_activeTab == ProyekTab.semua) {
      return _allItems;
    }

    return _allItems.where((item) {
      switch (_activeTab) {
        case ProyekTab.interior:
          return item.id.startsWith('i');
        case ProyekTab.renovasi:
          return item.id.startsWith('r');
        case ProyekTab.konstruksi:
          return item.id.startsWith('k');
        default:
          return true;
      }
    }).toList();
  }

  Future<void> loadData() async {
    final jsonStr = await rootBundle.loadString(
      'assets/data/proyek.json',
    );
    final List data = json.decode(jsonStr);

    _allItems = data.map((e) => ProyekModel.fromJson(e)).toList();
    notifyListeners();
  }

  void changeTab(ProyekTab tab) {
    _activeTab = tab;
    notifyListeners();
  }

  // ✅ Helper untuk mengubah tab berdasarkan index (untuk UI)
  void changeTabByIndex(int index) {
    switch (index) {
      case 0:
        changeTab(ProyekTab.semua);
        break;
      case 1:
        changeTab(ProyekTab.interior);
        break;
      case 2:
        changeTab(ProyekTab.renovasi);
        break;
      case 3:
        changeTab(ProyekTab.konstruksi);
        break;
    }
  }
}

enum ProyekTab {
  semua,
  interior,
  renovasi,
  konstruksi,
}
