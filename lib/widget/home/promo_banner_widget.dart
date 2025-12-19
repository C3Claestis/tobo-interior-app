// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/home/promo_banner_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PromoBannerProv>(
      builder: (_, prov, _) {
        return SizedBox(
          width: double.infinity,
          height: 137,
          child: Stack(
            children: [
              // ===========================
              // Background Carousel
              // ===========================
              PageView.builder(
                controller: prov.pageController,
                itemCount: prov.bannerImages.length,
                onPageChanged: prov.onPageChanged,
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      prov.bannerImages[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  );
                },
              ),

              // ===========================
              // BUTTON DI DALAM BANNER
              // ===========================
              Positioned(
                right: 10,
                top: 12,
                //bottom: 36, // ⬅️ di atas indicator
                child: _bannerButton(),
              ),

              // ===========================
              // Indicator
              // ===========================
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(prov.bannerImages.length, (index) {
                    final active = prov.currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: active ? 14 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.softWood
                            : AppColors.warmBeige,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bannerButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.softWood,

        // ⬇️ HILANGKAN MIN HEIGHT DEFAULT
        minimumSize: Size.zero,
        padding: const EdgeInsets.only(left: 12, top: 0, bottom: 0),

        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Lihat Detail",
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.pureWhite,
            ),
          ),

          const Gap(5),

          // ICON BULAT
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/svgs/arrowRight.svg',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.softWood,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
