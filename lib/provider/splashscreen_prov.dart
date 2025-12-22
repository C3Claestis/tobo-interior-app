import 'package:flutter/material.dart';
import 'dart:async';

// ignore: unused_import
import '../main.dart';

class SplashscreenProv extends ChangeNotifier {
  bool _isStarted = false;

  void startTimer(BuildContext context) {
    if(_isStarted) return;
    _isStarted = true;

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/');
    });
  }
}
