// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/product_prov.dart';
import 'package:tobo_apk/widget/product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PageCadangan extends StatelessWidget {
  const PageCadangan({super.key});

  @override
  Widget build(BuildContext context) {
    final productProv = Provider.of<ProductProv>(context);

    if (productProv.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),              
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productProv.products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: index.isEven ? 260 : 220, // 🔥 SELANG SELING
                    child: ProductWidget(index: index),
                  );
                },
              ),
            ),
          ],
        ),
      
    );
  }
}
