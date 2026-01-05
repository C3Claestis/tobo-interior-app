// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/model/before_after_slider.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class DetailProyekPage extends StatelessWidget {
  const DetailProyekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: _appBarName("Detail Proyek"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _slider(),
            const Gap(25),
            _tittle("Desain Interior", AppColors.black, 24),
            const Gap(6),
            _category("Interior"),
            const Gap(12),
            _tittle("Deskripsi", AppColors.black, 16),
            const Gap(5),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: GoogleFonts.poppins(fontSize: 12, color: AppColors.black),
              textAlign: TextAlign.justify,
            ),
            const Gap(20),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Align _buttons() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: AppColors.softWood,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/wa.svg',
                width: 12,
                height: 10,
                colorFilter: const ColorFilter.mode(
                  AppColors.pureWhite,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Konsultasi Proyek Serupa',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: AppColors.pureWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _tittle(String text, Color? colors, double size) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: colors,
      ),
    );
  }

  Align _category(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.warmBeige,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.softWood,
            ),
          ),
        ),
      ),
    );
  }

  AspectRatio _slider() {
    return AspectRatio(
      aspectRatio: 340 / 260,
      child: BeforeAfterSlider(
        beforeImage: 'assets/images/jasa.png',
        afterImage: 'assets/images/jasa2.png',
      ),
    );
  }

  AppBar _appBarName(String name) {
    return AppBar(
      backgroundColor: AppColors.pureWhite,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
