// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/page/jasa_page.dart';
import 'package:tobo_apk/provider/jasa/jasa_content_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';
import '../provider/main_navigation_prov.dart';
import '../page/home_page.dart';
import '../widget/bottom_navbar_widget.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navProv = context.watch<MainNavigationProvider>();

    return Scaffold(
      appBar: _buildAppBar(navProv.currentIndex, context),
      body: _buildBody(navProv.currentIndex),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 73),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.softWood,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset('assets/svgs/wa.svg'),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: NavBar(
        currentIndex: navProv.currentIndex,
        onTap: (index) {
          context.read<MainNavigationProvider>().changeIndex(index);
        },
      ),
    );
  }

  AppBar _appBarHome() {
    return AppBar(
      automaticallyImplyLeading: false, // ❌ matikan back button
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🔹 Left - Avatar
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/logo_tobo.png'),
            ),
            const Gap(12),
            // 🔹 Center - Title
            Expanded(
              child: Text(
                "TOBO Interior",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ),
            // 🔹 Right - Notification Icon
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarJasa(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.pureWhite,
      automaticallyImplyLeading: false, // ❌ matikan back button
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textTab(context, "Interior", 0),
            _textTab(context, "Konstruksi Ringan", 1),
          ],
        ),
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
                  fontWeight:
                      isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive
                      ? AppColors.softWood
                      : AppColors.black,
                ),
              ),
              const Gap(6),
              LayoutBuilder(
                builder: (context, constraints) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 3,
                  width: isActive ? constraints.maxWidth : 0,
                  color: AppColors.softWood,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}


  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();

      case 1:
        return const JasaPage();

      // case 1:
      //   return FutureBuilder<List<CategoryModel>>(
      //     future: CategoryService().getCategories(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       if (!snapshot.hasData) {
      //         return const Center(child: Text("No Data"));
      //       }
      //       return FindproductPage(categories: snapshot.data!);
      //     },
      //   );

      // case 3:
      //   return const FavouritePage();

      // case 4:
      //   return const AccountPage();

      default:
        return const HomePage();
    }
  }

  PreferredSizeWidget? _buildAppBar(int index, BuildContext context) {
    switch (index) {
      case 0:
        return _appBarHome();
      case 1:
        return _appBarJasa(context);
      default:
        return null;
    }
  }
}
