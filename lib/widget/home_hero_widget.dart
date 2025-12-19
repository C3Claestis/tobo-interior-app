// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/home_hero_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class HomeHeroWidget extends StatelessWidget {
  const HomeHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<HomeHeroProv>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🔥 FULL WIDTH CONTAINER
        SizedBox(
          height: 160,
          width: double.infinity,
          child: NotificationListener<ScrollNotification>(
            onNotification: (_) {
              prov.onScroll();
              return false;
            },
            child: ListView.separated(
              controller: prov.scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              itemCount: prov.banners.length,
              separatorBuilder: (_, _) => const Gap(12),
              itemBuilder: (context, index) {
                final banner = prov.banners[index];

                return SizedBox(
                  width: 290, // 🔥 FIXED BANNER SIZE
                  height: 160,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(banner.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner.title,
                              style: GoogleFonts.poppins(
                                color: AppColors.pureWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              banner.description,
                              style: GoogleFonts.inter(
                                color: AppColors.pureWhite,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 126,
                                  child: ElevatedButton.icon(
                                    onPressed: () => prov.onBannerTap(index),
                                    icon: SvgPicture.asset(
                                      'assets/svgs/sofa.svg',
                                      width: 12,
                                      height: 12,
                                    ),
                                    label: Text(
                                      banner.buttonTextLeft,
                                      style: GoogleFonts.inter(
                                        fontSize: 10,
                                        color: AppColors.pureWhite,
                                        height: 1,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.softWood,
                                      foregroundColor: AppColors.pureWhite,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 24,
                                  width: 126,
                                  child: ElevatedButton.icon(
                                    onPressed: () => prov.onBannerTap(index),
                                    icon: SvgPicture.asset(
                                      'assets/svgs/konstruksi.svg',
                                    ),
                                    label: Text(
                                      banner.buttonTextRight,
                                      style: GoogleFonts.inter(
                                        fontSize: 10,
                                        color: AppColors.pureWhite,
                                        height: 1,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.softWood,
                                      foregroundColor: AppColors.pureWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        const Gap(17),

        // 🔹 INDICATOR
        _indicator(prov),
      ],
    );
  }

  Row _indicator(HomeHeroProv prov) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(prov.banners.length, (index) {
        final active = index == prov.currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 14 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? AppColors.softWood : AppColors.warmBeige,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}
