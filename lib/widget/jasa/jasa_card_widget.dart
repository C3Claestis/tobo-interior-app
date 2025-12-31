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
          height: 215,
          child: Card(
            color: AppColors.pureWhite,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jasa.title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            jasa.description,
                            style: GoogleFonts.poppins(
                              fontSize: 10,                          
                              color: AppColors.black,                        
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 75,
                  right: 16,
                  child: SizedBox(
                    width: 158,
                    height: 24,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton.icon(
                        onPressed: onWhatsappTap,
                        icon: SvgPicture.asset(
                          'assets/svgs/wa.svg',
                          width: 12,
                          height: 12,
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
                          minimumSize: const Size(0, 0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
