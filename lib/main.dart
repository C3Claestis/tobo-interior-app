import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/profile_prov.dart';
import 'package:tobo_apk/page/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProv()),        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false, home: HomePage());
}
