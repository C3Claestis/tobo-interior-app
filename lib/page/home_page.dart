import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widget/home/quickactions_widget.dart';
import '../provider/home/home_hero_prov.dart';
import '../theme/appcolor.dart';
import '../widget/home/home_hero_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(color: Colors.amber, height: 100, width: 100),
              const Gap(12),
              // 🔥 Hero banner
              const HomeHeroWidget(),
              const Gap(12),
              // 🔥 Quick Actions
              Text(
                "Quick Actions",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const Gap(8),
              GridView.count(
                padding: EdgeInsets.zero,
                mainAxisSpacing: 10,
                crossAxisSpacing: 11,
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: (165 / 45),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  QuickactionsWidget(index: 0),
                  QuickactionsWidget(index: 1),
                  QuickactionsWidget(index: 2),
                  QuickactionsWidget(index: 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
