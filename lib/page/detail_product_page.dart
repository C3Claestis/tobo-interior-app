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
        statusBarColor: Colors.white, // BAR PUTIH
        statusBarIconBrightness: Brightness.light, // ICON HITAM (Android)
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DetailProdcutBannerProv()),
        ],
        child: Scaffold(
          backgroundColor: AppColors.pureWhite,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [DetailBannerProductWidget(), _header(context)],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 25,
                  ),
                  child: SizedBox(
                    width: double.infinity,
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
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _buttons() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        width: 186,
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
            'Pesan via WhatsApp',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.pureWhite,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _isiSpekProduk() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rowSpekProduk(
            "Material",
            "Ukuran",
            "Motif",
            "Brand",
            AppColors.mistGrey,
          ),
          const Gap(24),
          _rowSpekProduk(
            "Bahan XPE",
            "280cm x 50cm",
            "Linen",
            "-",
            AppColors.black,
          ),
        ],
      ),
    );
  }

  Container _rowSpekProduk(
    String text1,
    String text2,
    String text3,
    String text4,
    Color colors,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 84,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _teksSpekProduk(text1, colors),
          _teksSpekProduk(text2, colors),
          _teksSpekProduk(text3, colors),
          _teksSpekProduk(text4, colors),
        ],
      ),
    );
  }

  Widget _teksSpekProduk(String text, Color colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 12, color: colors)),
    );
  }

  Align _statusTanyaWa() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
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
                      "Detail Produk",
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
