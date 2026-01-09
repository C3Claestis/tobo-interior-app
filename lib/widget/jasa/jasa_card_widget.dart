import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobo_apk/model/jasa_model.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class JasaCardWidget extends StatelessWidget {
  final JasaModel jasa;
  final VoidCallback onWhatsappTap;

  const JasaCardWidget({
    super.key,
    required this.jasa,
    required this.onWhatsappTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/detailJasa'),
        child: SizedBox(
          child: Card(
            color: AppColors.pureWhite,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none, // 🔑 WAJIB
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            jasa.image,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -14, // ← RELATIF KE IMAGE
                          right: 16,
                          child: SizedBox(
                            height: 26,
                            child: ElevatedButton.icon(
                              onPressed: onWhatsappTap,
                              icon: SvgPicture.asset(
                                'assets/svgs/wa.svg',
                                width: 12,
                                height: 10,
                              ),
                              label: Text(
                                'Konsultasi via WhatsApp',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.pureWhite,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.softWood,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jasa.title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            jasa.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
