import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.amber
      ),      
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      child: Text("data"),
    );
  }
}
