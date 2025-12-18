// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProv extends ChangeNotifier {
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        _products = List<Map<String, dynamic>>.from(
          data['products'].map(
            (item) => {
              'id': item['id'],
              'title': item['title'],
              'description': item['description'],
              'price': item['price'],
              'imageUrl': item['thumbnail'], // 🔥 gambar dari API
            },
          ),
        );
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Fetch error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
