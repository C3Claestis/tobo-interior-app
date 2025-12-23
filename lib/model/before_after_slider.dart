// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/proyek/before_after_slider_prov.dart';
import 'package:tobo_apk/theme/appcolor.dart';

class BeforeAfterSlider extends StatelessWidget {
  final String beforeImage;
  final String afterImage;

  const BeforeAfterSlider({
    super.key,
    required this.beforeImage,
    required this.afterImage,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BeforeAfterSliderProv(),
      child: _BeforeAfterSliderView(
        beforeImage: beforeImage,
        afterImage: afterImage,
      ),
    );
  }
}

class _BeforeAfterSliderView extends StatelessWidget {
  final String beforeImage;
  final String afterImage;

  const _BeforeAfterSliderView({
    required this.beforeImage,
    required this.afterImage,
  });

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<BeforeAfterSliderProv>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            context.read<BeforeAfterSliderProv>().updateDrag(
              details.delta.dx,
              width,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(4, 6), // shadow kanan & bawah
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // BEFORE
                  Image.asset(
                    beforeImage,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  // AFTER (CLIPPED)
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: prov.dragPosition,
                      child: Image.asset(
                        afterImage,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // DIVIDER
                  Positioned(
                    left: width * prov.dragPosition - 1,
                    top: 0,
                    bottom: 0,
                    child: Container(width: 2, color: AppColors.pureWhite),
                  ),

                  // HANDLE
                  Positioned(
                    left: width * prov.dragPosition - 20,
                    top: height / 2 - 20,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/handle.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
