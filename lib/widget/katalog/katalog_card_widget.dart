// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:tobo_apk/main.dart';
import 'package:tobo_apk/model/katalog_model.dart';
import 'package:tobo_apk/theme/appcolor.dart';
import 'package:intl/intl.dart';

class KatalogCardWidget extends StatelessWidget {
  final KatalogModel item;
  final VoidCallback onPesanTap;

  const KatalogCardWidget({
    super.key,
    required this.item,
    required this.onPesanTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.detailKatalog),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(7, 7),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= IMAGE (EXPANDED) =================
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // ================= CONTENT (FIXED HEIGHT) =================
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 10,
                right: 10,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),

                  Text(
                    "${rupiah(item.priceMinimum)} - ${rupiah(item.priceMaximum)}",
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.softWood,
                    ),
                  ),
                  const Gap(5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 69,
                        height: 24,
                        child: ElevatedButton.icon(
                          onPressed: onPesanTap,
                          icon: SvgPicture.asset(
                            'assets/svgs/wa.svg',
                            height: 10,
                            width: 12,
                          ),
                          label: Text(
                            "Pesan",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 0,
                            ),
                            minimumSize: Size.zero, // 🔥 PENTING
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            backgroundColor: AppColors.softWood,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String rupiah(num value) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(value);
  }
}
