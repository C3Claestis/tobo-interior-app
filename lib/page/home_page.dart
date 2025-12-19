import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/home_hero_prov.dart';
import 'package:tobo_apk/widget/home_hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {    
    return ChangeNotifierProvider(
      create: (_) => HomeHeroProv(),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          width: double.infinity,
          child: Column(
            children: [
              Container(color: Colors.amber, height: 100, width: 100),
              const Gap(12),
              // 🔥 Hero banner (1x saja)
              const HomeHeroWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
