// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/main.dart';
import 'package:tobo_apk/page/chat_page.dart';
import 'package:tobo_apk/page/jasa_page.dart';
import 'package:tobo_apk/page/katalog_page.dart';
import 'package:tobo_apk/page/proyek_page.dart';
import 'package:tobo_apk/provider/whatsapp_provider.dart';
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
        child: Consumer<WhatsAppProvider>(
          builder: (context, value, _) => Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: value.isLoading
                  ? null
                  : () {
                      value.openWhatsApp(
                        context: context,
                        phoneNumber: '628812553446',
                        message: 'Halo Tobo Interior!',
                      );
                    },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.softWood,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 8),
                  ],
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

  AppBar _appBarHome(BuildContext context) {
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
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.profilePage),
              icon: const Icon(Icons.notifications),
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarName(String name) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.pureWhite,
      automaticallyImplyLeading: false, // ❌ matikan back button
      elevation: 0,
      titleSpacing: 0,
      title: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const JasaPage();
      case 2:
        return const KatalogPage();
      case 3:
        return const ProyekPage();
      case 4:
        return const ChatPage();
      default:
        return const HomePage();
    }
  }

  PreferredSizeWidget? _buildAppBar(int index, BuildContext context) {
    switch (index) {
      case 0:
        return _appBarHome(context);
      case 1:
        return _appBarName("Jasa");
      case 2:
        return _appBarName("Katalog Produk");
      case 3:
        return _appBarName("Proyek Kami");
      case 4:
        return _appBarName("Hubungi Kami");
      default:
        return null;
    }
  }
}
