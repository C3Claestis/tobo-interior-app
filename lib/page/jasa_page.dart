import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/jasa/jasa_content_prov.dart';
import '../theme/appcolor.dart';
import '../widget/jasa/jasa_card_widget.dart';

class JasaPage extends StatelessWidget {
  const JasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final jasaProv = context.watch<JasaContentProv>();

    return SafeArea(
      child: Column(
        children: [
          // ================= HEADER (TIDAK SCROLL) =================
          _headerTab(context),

          // ================= LIST (SCROLL) =================
           Expanded(
            child: PageView(
              controller: jasaProv.pageController,
              onPageChanged: jasaProv.onPageChanged,
              children: [
                _jasaList(jasaProv.filteredJasa),
                _jasaList(jasaProv.filteredJasa),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jasaList(List jasaList) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: jasaList.length,
      itemBuilder: (_, index) {
        final jasa = jasaList[index];
        return JasaCardWidget(
          jasa: jasa,
          onWhatsappTap: () {},
        );
      },
    );
  }

  Widget _headerTab(BuildContext context) {
    return Container(
      color: AppColors.pureWhite,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _textTab(context, "Interior", 0),
          _textTab(context, "Konstruksi Ringan", 1),
        ],
      ),
    );
  }

  Widget _textTab(BuildContext context, String text, int index) {
    return Expanded(
      child: Consumer<JasaContentProv>(
        builder: (context, jasaProv, _) {
          final isActive = jasaProv.selectedTab == index;

          return TextButton(
            onPressed: () => jasaProv.changeTab(index),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              overlayColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? AppColors.softWood : AppColors.black,
                  ),
                ),
                const Gap(6),

                // ✅ FIX: LayoutBuilder
                LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 3,
                      width: isActive ? constraints.maxWidth : 0,
                      color: AppColors.softWood,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
