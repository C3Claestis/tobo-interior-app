// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.pureWhite,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: AppColors.pureWhite,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3), // tebal stroke
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.softWood, // warna stroke
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/logo_tobo.png'),
              ),
            ),
            const Gap(12),
            Text(
              "TOBO INTERIOR",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Gap(25),
            _content("Tentang Tobo Interior", 'assets/svgs/info.svg'),
            const Gap(5),
            _content("Syarat & Ketentuan", 'assets/svgs/sk.svg'),
            const Gap(5),
            _content("Kebijakan Privasi", 'assets/svgs/kebijakanprivasi.svg'),
            const Gap(5),
            _content("Hubungi Admin", 'assets/svgs/hbadmin.svg'),
          ],
        ),
      ),
    );
  }

  Align _content(String text, String path) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {},
        style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
        icon: SvgPicture.asset(
          path,
          color: AppColors.softWood,
          width: 16,
          height: 16,
        ),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
