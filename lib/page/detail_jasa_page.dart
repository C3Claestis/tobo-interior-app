// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class DetailJasaPage extends StatelessWidget {
  const DetailJasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final tinggiContent = 777;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height + tinggiContent, // tambah sesuai konten
          child: Stack(
            children: [
              _bgImg(),
              _header(context),
              Positioned(
                top: 190,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),                      
                    ),
                    color: AppColors.pureWhite,
                  ),
                  height: tinggiContent.toDouble(),
                  width: double.infinity,
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _bgImg() {
    return SizedBox(
      width: double.infinity,
      height: 269,
      child: Image.asset('assets/images/HERO.png', fit: BoxFit.cover),
    );
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.softWood.withOpacity(.6),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: SvgPicture.asset(
                          'assets/svgs/arrowLeft.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Detail Jasa",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.pureWhite,
                      ),
                    ),
                  ),

                  // ================= DUMMY (PENYEIMBANG) =================
                  const SizedBox(width: 40, height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
