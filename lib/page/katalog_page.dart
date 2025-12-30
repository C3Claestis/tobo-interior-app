import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/katalog/katalog_prov.dart';
import '../theme/appcolor.dart';
import '../widget/katalog/katalog_card_widget.dart';

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'tittle': "Semua"},
      {'tittle': "Wallpaper"},
      {'tittle': "HPL"},
      {'tittle': "Panel"},
    ];
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, _) => const Gap(12),
              itemBuilder: (context, index) {
                return _categoryButton(
                  context,
                  categories[index]['tittle']!,
                  index,
                );
              },
            ),
          ),
          const Gap(16),
          // ================= GRID =================
          Expanded(
            child: Consumer<KatalogProvider>(
              builder: (context, prov, _) {
                final items = prov.filteredItems;

                if (items.isEmpty) {
                  return const Center(child: Text('Data tidak tersedia'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200, // max lebar 1 item
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85, // rasio fleksibel
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return KatalogCardWidget(item: item, onPesanTap: () {});
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(BuildContext context, String title, int index) {
    // ✅ Gunakan KatalogProvider agar sinkron dengan list produk
    return Consumer<KatalogProvider>(
      builder: (context, prov, _) {
        // Tentukan active index berdasarkan enum di provider
        int activeIndex = 0;
        switch (prov.activeTab) {
          case KatalogTab.semua:
            activeIndex = 0;
            break;
          case KatalogTab.wallpaper:
            activeIndex = 1;
            break;
          case KatalogTab.hpl:
            activeIndex = 2;
            break;
          case KatalogTab.panel:
            activeIndex = 3;
            break;
        }
        final bool isActive = activeIndex == index;

        return ElevatedButton(
          onPressed: () => prov.changeTabByIndex(index),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 24),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            elevation: 0,

            // 🎨 WARNA
            backgroundColor: isActive
                ? AppColors.softWood
                : AppColors.pureWhite,
            foregroundColor: isActive
                ? AppColors.pureWhite
                : AppColors.softWood,

            // 🟤 BORDER
            side: isActive
                ? BorderSide.none
                : BorderSide(color: AppColors.softWood),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
