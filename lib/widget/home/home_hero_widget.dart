// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/home/home_hero_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class HomeHeroWidget extends StatelessWidget {
  const HomeHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeHeroProv>(
      builder: (_, prov, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroBanner(context, prov),
            const Gap(17),
            _indicator(prov),
          ],
        );
      },
    );
  }

  SizedBox _heroBanner(BuildContext context, HomeHeroProv prov) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: NotificationListener<ScrollNotification>(
        onNotification: (_) {
          context.read<HomeHeroProv>().onScroll(); // 🔥 listen false
          return false;
        },
        child: ListView.separated(
          controller: prov.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: prov.banners.length,
          separatorBuilder: (_, _) => const Gap(12),
          itemBuilder: (_, index) {
            final banner = prov.banners[index];

            return SizedBox(
              width: 290,
              height: 160,
              child: Stack(
                children: [
                  _backgroundImage(banner.image),
                  _gradientOverlay(),
                  _content(context, prov, banner, index),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _backgroundImage(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }

  Widget _gradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, HomeHeroProv prov, banner, int index) {
    return Positioned(
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
            children: [
              _actionButton(
                context,
                icon: 'assets/svgs/sofa.svg',
                text: banner.buttonTextLeft,
                onTap: () => context.read<HomeHeroProv>().onBannerTap(index),
              ),
              _actionButton(
                context,
                icon: 'assets/svgs/konstruksi.svg',
                text: banner.buttonTextRight,
                onTap: () => context.read<HomeHeroProv>().onBannerTap(index),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
    BuildContext context, {
    required String icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 24,
      width: 126,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: SvgPicture.asset(icon, width: 12, height: 12),
        label: Text(
          text,
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
