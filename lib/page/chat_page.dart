// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(50),
              _img(),
              const Gap(25),
              _buttonsWa(),
              const Gap(8),
              _templateChat(),
              const Gap(8),
              _thereeButton(),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _footer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Jam Operasional",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Senin - Kamis",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mistGrey,
                  ),
                ),
                Text(
                  "09.00 - 15.00 WIB",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jumat",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mistGrey,
                  ),
                ),
                Text(
                  "09.00 - 12.00 WIB",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _thereeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SizedBox(
        width: double.infinity,
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buttons("Interior Rumah", "assets/svgs/sofa.svg"),
            _buttons("Tanya Produk", "assets/svgs/katalog.svg"),
            _buttons("Konstruksi Ringan", "assets/svgs/konstruksi.svg"),
          ],
        ),
      ),
    );
  }

  SizedBox _img() {
    return SizedBox(
      width: 270,
      height: 244,
      child: Image.asset('assets/images/chatImg.png', fit: BoxFit.cover),
    );
  }

  Text _templateChat() {
    return Text(
      "Template Chat",
      style: GoogleFonts.poppins(fontSize: 8, color: AppColors.black),
    );
  }

  SizedBox _buttons(String text, String path) {
    return SizedBox(
      height: 24,
      child: TextButton.icon(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ), // ✅ hilangkan padding
          minimumSize: Size.zero, // ✅ hapus min size bawaan
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // ✅ cegah area klik default
          visualDensity: VisualDensity.compact, // ✅ rapatkan layout
          backgroundColor: AppColors.softWood,
        ),
        icon: SvgPicture.asset(
          path,
          color: AppColors.pureWhite,
          width: 12,
          height: 10,
        ),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }

  SizedBox _buttonsWa() {
    return SizedBox(
      height: 40,
      width: 213,
      child: TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.softWood),
        ),
        icon: SvgPicture.asset(
          'assets/svgs/wa.svg',
          color: AppColors.pureWhite,
          width: 12,
          height: 10,
        ),
        label: Text(
          'Chat WhatsApp Sekarang',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}
