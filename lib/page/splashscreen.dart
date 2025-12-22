import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import '../base/responsive_page.dart';
import '../provider/splashscreen_prov.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashscreenProv>().startTimer(context);
    });

    return ResponsivePage(
      headerPercent: 0.25,
      bodyPercent: 0.50,
      footerPercent: 0.25,

      header: Container(color: Colors.amber),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Splash Screen"), Gap(16)],
          ),
        ),
      ),
    );
  }
}
