import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/jasa/jasa_content_prov.dart';
import 'package:tobo_apk/widget/jasa/jasa_card_widget.dart';

class JasaPage extends StatelessWidget {
  const JasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final jasaProv = context.watch<JasaContentProv>();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: jasaProv.filteredJasa.length,
      itemBuilder: (context, index) {
        final jasa = jasaProv.filteredJasa[index];

        return JasaCardWidget(
          jasa: jasa,
          onWhatsappTap: () {
            // launch whatsapp
          },
        );
      },
    );
  }
}
