// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/home/quick_actions_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class QuickactionsWidget extends StatelessWidget {
  final int index;

  const QuickactionsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuickActionsProv>(
      builder: (context, prov, _) => TextButton.icon(
        onPressed: () => prov.onTap(index, context),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft, // 🔥 mulai dari kiri
          padding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: AppColors.warmBeige,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: SvgPicture.asset(
          prov.quickActions[index].iconPath,
          color: AppColors.softWood,
          width: 24,
          height: 24,
        ),
        label: Text(
          prov.quickActions[index].title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
