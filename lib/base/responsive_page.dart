import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  final double headerPercent;
  final double bodyPercent;
  final double footerPercent;

  final Widget? header;
  final Widget body;
  final Widget? footer;

  final Color backgroundColor;

  const ResponsivePage({
    super.key,
    this.headerPercent = 0.15,
    this.bodyPercent = 0.70,
    this.footerPercent = 0.15,
    this.header,
    required this.body,
    this.footer,
    this.backgroundColor = Colors.white,
  }) : assert(
         (headerPercent + bodyPercent + footerPercent) == 1.0,
         'Total percent harus 1.0 (100%)',
       );

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;
    final width = media.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          /// 🔵 HEADER (MENTOK ATAS, TANPA SAFEAREA)
          if (header != null)
            SizedBox(
              height: height * headerPercent,
              width: width,
              child: header,
            ),

          /// 🟢 BODY + FOOTER (AMAN DARI NOTCH)
          Expanded(
            child: SafeArea(
              top: false, // ❗ Jangan dorong dari header
              child: Column(
                children: [
                  /// BODY
                  SizedBox(
                    height: height * bodyPercent,
                    width: width,
                    child: body,
                  ),

                  /// FOOTER
                  if (footer != null)
                    SizedBox(
                      height: height * footerPercent,
                      width: width,
                      child: footer,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
