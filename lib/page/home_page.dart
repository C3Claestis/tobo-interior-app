// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/home/promo_banner_prov.dart';
import '../widget/home/promo_banner_widget.dart';
import '../widget/home/quickactions_widget.dart';
import '../provider/home/home_hero_prov.dart';
import '../theme/appcolor.dart';
import '../widget/home/home_hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeHeroProv()),
        ChangeNotifierProvider(create: (_) => PromoBannerProv()),
      ],
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(12),
              // 🔥 Hero banner
              const HomeHeroWidget(),
              const Gap(12),
              // 🔥 Quick Actions
              _quickActionsTxt(),
              const Gap(8),
              _isiQuickActions(),
              const Gap(12),
              _keunggulanTxt(),
              const Gap(8),
              _txtIsiKeunggulan(),
              const Gap(12),
              PromoBannerWidget(),
              const Gap(12),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Row _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Butuh estimitasi cepat?",
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svgs/wa.svg',
            width: 12,
            height: 12,
            color: AppColors.softWood,
          ),
          label: Text(
            "Chat Via Whatsapp",
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.softWood,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pureWhite,
            foregroundColor: AppColors.softWood,
            minimumSize: const Size(155, 30), // 🔥 height 30
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ), // kecilkan padding
            elevation: 0,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            side: BorderSide(color: AppColors.softWood),
          ),
        ),
      ],
    );
  }

  GridView _isiQuickActions() {
    return GridView.count(
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
    );
  }

  Text _quickActionsTxt() {
    return Text(
      "Quick Actions",
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }

  Row _txtIsiKeunggulan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Profesional",
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.softWood,
          ),
        ),
        const Gap(6),
        Text(
          "Tempat Waktu",
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.softWood,
          ),
        ),
        const Gap(6),
        Text(
          "Harga Jelas",
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Container _keunggulanTxt() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        "Keunggulan",
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
