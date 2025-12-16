import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/page/splashscreen.dart';
import 'package:tobo_apk/provider/profile_prov.dart';
import 'package:tobo_apk/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProfileProv())],
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
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.splashscreen: (context) => const Splashscreen(),
    },
  );
}

class AppRoutes {
  static const home = '/';
  static const splashscreen = '/splashscreen';
}
