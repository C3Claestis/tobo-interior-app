// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/notification_provider.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class NotificationCardWidget extends StatelessWidget {
  final int index;
  const NotificationCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => context.read<NotificationProvider>().toggleTapped(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),          
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== ICON =====
              Container(
                decoration: BoxDecoration(
                  color: AppColors.warmBeige,                  
                  shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/svgs/sofa.svg',
                    color: AppColors.softWood,
                    fit: BoxFit.contain,
                    width: 18,
                    height: 15,
                  ),
                ),
              ),

              const Gap(15),

              // ===== CONTENT (RESPONSIVE) =====
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Consumer<NotificationProvider>(
                          builder: (context, value, _) {
                            final isTapped = value.isTapped(index);
                            return Container(
                              width: isTapped ? 0 : 5,
                              height: isTapped ? 0 : 5,
                              decoration: BoxDecoration(
                                color: AppColors.softWood,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                        Consumer<NotificationProvider>(
                          builder: (context, value, child) {
                            final isTapped = value.isTapped(index);
                            return Gap(isTapped ? 0 : 5);
                          },
                        ),
                        Expanded(
                          child: Text(
                            'Notification Title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'This is a sample notification message to demonstrate the notification card layout Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
