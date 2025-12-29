// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tobo_apk/model/services/whatsapp_service.dart';

class WhatsAppProvider extends ChangeNotifier {
  final WhatsAppService _service = WhatsAppService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> openWhatsApp({
    required BuildContext context,
    required String phoneNumber,
    String? message,
  }) async {
    _isLoading = true;
    notifyListeners();

    final success = await _service.openChat(
      phoneNumber: phoneNumber,
      message: message,
    );

    _isLoading = false;
    notifyListeners();

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('WhatsApp tidak terpasang atau tidak dapat dibuka'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
