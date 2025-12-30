import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/page/chat_page.dart';
import 'package:tobo_apk/page/detail_product_page.dart';
import 'package:tobo_apk/page/detail_proyek_page.dart';
import 'package:tobo_apk/page/profile_page.dart';
import 'package:tobo_apk/provider/whatsapp_provider.dart';
import 'provider/main_navigation_prov.dart';
import '../page/detail_jasa_page.dart';
import '../page/katalog_page.dart';
import '../provider/home/quick_actions_prov.dart';
import '../provider/jasa/jasa_content_prov.dart';
import '../provider/katalog/katalog_prov.dart';
import '../provider/proyek/proyek_prov.dart';
import '../base/main_navigation_page.dart';
import '../page/home_page.dart';
import '../page/splashscreen.dart';
import '../provider/profile_prov.dart';
import '../provider/splashscreen_prov.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProv()),
        ChangeNotifierProvider(create: (_) => SplashscreenProv()),
        ChangeNotifierProvider(create: (_) => MainNavigationProvider()),
        ChangeNotifierProvider(create: (_) => QuickActionsProv()),
        ChangeNotifierProvider(create: (_) => JasaContentProv()),
        ChangeNotifierProvider(create: (_) => WhatsAppProvider()),
        ChangeNotifierProvider(create: (_) => ProyekProvider()..loadData()),
        ChangeNotifierProvider(create: (_) => KatalogProvider()..loadData()),        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.splashscreen,
    routes: {
      AppRoutes.mainPage: (context) => const MainNavigationPage(),
      AppRoutes.splashscreen: (context) => const Splashscreen(),
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.katalogProduk: (context) => const KatalogPage(),
      AppRoutes.detailJasa: (context) => const DetailJasaPage(),
      AppRoutes.detailKatalog: (context) => const DetailProductPage(),
      AppRoutes.detailProyek: (context) => const DetailProyekPage(),
      AppRoutes.chatPage: (context) => const ChatPage(),
      AppRoutes.profilePage: (context) => const ProfilePage(),
    },
  );
}

class AppRoutes {
  static const mainPage = '/';
  static const home = '/home';
  static const splashscreen = '/splashscreen';
  static const konstruksiRingan = '/konstruksiRingan';
  static const interior = '/interior';
  static const renovasi = '/renovasi';
  static const katalogProduk = '/katalogProduk';
  static const detailJasa = '/detailJasa';
  static const detailKatalog = '/detailKatalog';
  static const detailProyek = '/detailProyek';
  static const chatPage = '/chatPage';
  static const profilePage = '/profilePage';
}
