// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class DetailJasaPage extends StatelessWidget {
  const DetailJasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final steps = [
      StepItem(
        step: "Step 01",
        title: "Survey",
        icon: SvgPicture.asset(
          'assets/svgs/survey.svg',
          color: AppColors.softWood,
        ),
      ),
      StepItem(
        step: "Step 02",
        title: "Desain / Estimasi",
        icon: SvgPicture.asset(
          'assets/svgs/doe.svg',
          color: AppColors.softWood,
        ),
      ),
      StepItem(
        step: "Step 03",
        title: "Pengerjaan",
        icon: SvgPicture.asset(
          'assets/svgs/pengerjaan.svg',
          color: AppColors.softWood,
        ),
      ),
      StepItem(
        step: "Step 04",
        title: "Serah Terima",
        icon: SvgPicture.asset(
          'assets/svgs/serahterima.svg',
          color: AppColors.softWood,
        ),
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // BAR PUTIH
        statusBarIconBrightness: Brightness.light, // ICON HITAM (Android)
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: Scaffold(
        backgroundColor: AppColors.pureWhite,
        body: SingleChildScrollView(
          // tambah sesuai konten
          child: Stack(
            children: [
              Stack(children: [_bgImg(), _header(context)]),
              Container(
                margin: EdgeInsets.only(top: 250 - (height * 0.12)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: AppColors.pureWhite,
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Desain Interior",
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        const Gap(12),
                        _tittle("Deskripsi"),
                        const Gap(5),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n \nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Gap(12),
                        _tittle("Lingkup Pekerjaan"),
                        const Gap(5),
                        Column(
                          children: [
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                            bulletText("Lorem ipsum dolor sit amet"),
                          ],
                        ),
                        const Gap(12),
                        _tittle("Proses Kerja"),
                        const Gap(12),
                        Column(
                          children: List.generate(steps.length, (index) {
                            final item = steps[index];
                            return timelineStep(
                              step: item.step,
                              title: item.title,
                              icon: item.icon,
                              isLast: index == steps.length - 1,
                            );
                          }),
                        ),
                        const Gap(20),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttons(
                                "Minta Estimasi",
                                "assets/svgs/mintaestimasi.svg",
                                false,
                              ),
                              const Gap(20),
                              _buttons(
                                "Konsultasi via WhatsApp",
                                "assets/svgs/wa.svg",
                                true,
                              ),
                            ],
                          ),
                        ),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buttons(String name, String path, bool wa) {
    return Expanded(
      child: SizedBox(
        height: 30,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: wa ? AppColors.softWood : AppColors.pureWhite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                color: wa ? Colors.transparent : AppColors.black,
                width: wa ? 0 : 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                path,
                width: 12,
                height: 10,
                colorFilter: ColorFilter.mode(
                  wa ? AppColors.pureWhite : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 1, // 🔑 biar sejajar icon
                  color: wa ? AppColors.pureWhite : AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _tittle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }

  Widget bulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: GoogleFonts.poppins(fontSize: 12, color: AppColors.black),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 12, color: AppColors.black),
          ),
        ),
      ],
    );
  }

  SizedBox _bgImg() {
    return SizedBox(
      width: double.infinity,
      height: 269,
      child: Image.asset('assets/images/HERO.png', fit: BoxFit.cover),
    );
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          SizedBox(
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
                    "Detail Jasa",
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
        ],
      ),
    );
  }

  Widget timelineStep({
    required String step,
    required String title,
    required Widget icon,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT TIMELINE
          SizedBox(
            width: 32,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // LINE
                Positioned(
                  top: 40,
                  bottom: isLast ? 40 : 0,
                  child: Container(width: 2, color: const Color(0xFFEAD8C0)),
                ),
                // CIRCLE ICON
                Positioned(
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SizedBox(width: 24, height: 24, child: icon),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // RIGHT CARD
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4.5,
              ),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFD9B07A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: AppColors.pureWhite,
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.pureWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepItem {
  final String step;
  final String title;
  final Widget icon;

  StepItem({required this.step, required this.title, required this.icon});
}
