// ignore_for_file: unnecessary_underscores, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../provider/product_prov.dart';

class ProductWidget extends StatelessWidget {
  final int index;

  const ProductWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // 🔒 AMAN – tidak menyebabkan rebuild
    final productProv = Provider.of<ProductProv>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 12, // makin besar → makin lembut
            spreadRadius: 0, // biar tidak melebar ke samping
            offset: const Offset(0, 6), // 🔥 jatuh ke bawah
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// IMAGE → ambil sisa ruang
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                productProv.products[index]['imageUrl'],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          ),

          const Gap(8),

          /// ✅ TITLE
          Consumer<ProductProv>(
            builder: (_, __, ___) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  productProv.products[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),

          const Gap(4),

          /// ✅ DESCRIPTION
          Consumer<ProductProv>(
            builder: (_, __, ___) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  productProv.products[index]['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),

          const Gap(4),

          /// ✅ PRICE
          Consumer<ProductProv>(
            builder: (_, __, ___) => Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  "Rp ${productProv.products[index]['price']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
