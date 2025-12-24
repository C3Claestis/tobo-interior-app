import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/splashscreen_prov.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashscreenProv>().startTimer(context);
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 260,
          height: 260,
          child: Image.asset(
            'assets/images/logo_tobo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
