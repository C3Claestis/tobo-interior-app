// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/katalog/detail_prodcut_banner_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class DetailBannerProductWidget extends StatelessWidget {
  const DetailBannerProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProdcutBannerProv>(
      builder: (_, prov, _) {
        return SizedBox(
          width: double.infinity,
          height: 280,
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
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      prov.bannerImages[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  );
                },
              ),

              // ===========================
              // Indicator
              // ===========================
              Positioned(
                bottom: 12,
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
}
