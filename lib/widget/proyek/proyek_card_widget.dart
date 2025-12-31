// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/model/proyek_model.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class ProyekCardWidget extends StatelessWidget {
  final ProyekModel item;
  final VoidCallback onPesanTap;

  const ProyekCardWidget({
    super.key,
    required this.item,
    required this.onPesanTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detailProyek'),
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ================= IMAGE =================
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  item.imageUrl,
                  height: 93,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
          
              // ================= CONTENT =================
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 10,
                  right: 10,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
