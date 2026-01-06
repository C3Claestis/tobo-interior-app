import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/notification_provider.dart';
import 'package:tobo_apk/theme/appcolor.dart';
import 'package:tobo_apk/widget/notification_card_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        backgroundColor: AppColors.pureWhite,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // matikan leading default
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: AppColors.black),
                  ),
                ),
                Text(
                  'Notification',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hari Ini',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),                
                ChangeNotifierProvider(
                  create: (_) => NotificationProvider(),
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationCardWidget(index: index);
                    },
                  ),
                ),
                const Gap(20),
                Text(
                  'Minggu Ini',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ChangeNotifierProvider(
                  create: (_) => NotificationProvider(),
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationCardWidget(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
