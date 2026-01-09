// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/katalog/detail_prodcut_banner_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';
import 'package:tobo_apk/widget/katalog/detail_banner_product_widget.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 🔥 WAJIB
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DetailProdcutBannerProv()),
        ],
        child: Scaffold(
          extendBodyBehindAppBar: true, // 🔥 WAJIB
          backgroundColor: AppColors.pureWhite,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // ================= HERO + HEADER =================
                Stack(
                  children: [
                    const DetailBannerProductWidget(), // 🔥 banner full atas
                    _header(context), // 🔥 overlay
                  ],
                ),

                // ================= CONTENT =================
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tittle("Desain Interior", AppColors.black, 24),
                      _tittle("Rp80.000 - 113.000", AppColors.softWood, 24),
                      const Gap(8),
                      _statusTanyaWa(),
                      const Gap(12),

                      _tittle("Spesifikasi Produk", AppColors.black, 16),
                      const Gap(8),
                      _isiSpekProduk(),

                      const Gap(12),
                      _tittle("Deskripsi", AppColors.black, 16),
                      const Gap(5),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      const Gap(20),
                      _buttons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Padding _header(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        15,
        topPadding + 10, // 🔥 aman status bar
        15,
        10,
      ),
      child: SizedBox(
        height: 32,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.softWood.withOpacity(.6),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: SvgPicture.asset(
                  'assets/svgs/arrowLeft.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Detail Produk",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.pureWhite,
                ),
              ),
            ),
            const SizedBox(width: 40), // dummy penyeimbang
          ],
        ),
      ),
    );
  }

  // ================= BUTTON =================
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
            children: [
              SvgPicture.asset(
                'assets/svgs/wa.svg',
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.pureWhite,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(6),
              Text(
                'Pesan via WhatsApp',
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

  // ================= SPEK =================
  Widget _isiSpekProduk() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rowSpek("Material", "Ukuran", "Motif", "Brand", AppColors.mistGrey),
        const Gap(24),
        _rowSpek("Bahan XPE", "280cm x 50cm", "Linen", "-", AppColors.black),
      ],
    );
  }

  Widget _rowSpek(String t1, String t2, String t3, String t4, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _spekText(t1, color),
        _spekText(t2, color),
        _spekText(t3, color),
        _spekText(t4, color),
      ],
    );
  }

  Widget _spekText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 12, color: color)),
    );
  }

  // ================= STATUS =================
  Widget _statusTanyaWa() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: 161,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColors.warmBeige,
        ),
        child: Text(
          "Tanyakan stok via WhatsApp",
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: AppColors.softWood,
          ),
        ),
      ),
    );
  }

  // ================= TITLE =================
  Widget _tittle(String text, Color? color, double size) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
