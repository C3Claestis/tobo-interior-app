// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double headerPercent = 0.15; // 15%
  final double bodyPercent = 0.70; // 70%
  final double footerPercent = 0.15; // 15%

   @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;
    final screenWidth = media.size.width;

    return Scaffold(
      body: Column(
        children: [
          // 🔵 HEADER
          SizedBox(
            height: screenHeight * headerPercent,
            width: screenWidth,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "HEADER",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          // 🟢 BODY
          SizedBox(
            height: screenHeight * bodyPercent,
            width: screenWidth,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "BODY",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          // ⚫ FOOTER
          SizedBox(
            height: screenHeight * footerPercent,
            width: screenWidth,
            child: Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                "FOOTER",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
