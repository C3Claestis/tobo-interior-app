// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/main_navigation_prov.dart';
import '../page/home_page.dart';
import '../widget/bottom_navbar_widget.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navProv = context.watch<MainNavigationProvider>();

    return Scaffold(
      body: _buildBody(navProv.currentIndex),
      bottomNavigationBar: NavBar(
        currentIndex: navProv.currentIndex,
        onTap: (index) {
          context.read<MainNavigationProvider>().changeIndex(index);
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();

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

      // case 2:
      //   return const CartPage();

      // case 3:
      //   return const FavouritePage();

      // case 4:
      //   return const AccountPage();

      default:
        return const HomePage();
    }
  }
}
