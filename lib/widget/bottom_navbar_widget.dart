// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/appcolor.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, 'assets/svgs/home.svg', 'Home'),        
          _navItem(1, 'assets/svgs/jasa.svg', 'Jasa'),
          _navItem(2, 'assets/svgs/katalog.svg', 'Katalog'),
          _navItem(3, 'assets/svgs/proyek.svg', 'Proyek'),
          _navItem(4, 'assets/svgs/chat.svg', 'Chat'),
        ],
      ),
    );
  }

  Widget _navItem(int index, String iconPath, String label) {
    bool isActive = currentIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque, // <— AREA KLIK LEBAR
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 26,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.softWood : AppColors.black,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(iconPath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? AppColors.softWood : AppColors.black,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}