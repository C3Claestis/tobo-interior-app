import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  /// Return true jika berhasil membuka WhatsApp
  Future<bool> openChat({
    required String phoneNumber,
    String? message,
  }) async {
    final encodedMessage =
        message != null ? Uri.encodeComponent(message) : '';

    final uri = Uri.parse(
      'https://wa.me/$phoneNumber${message != null ? '?text=$encodedMessage' : ''}',
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        return true;
      } else {
        // Fallback: coba buka lewat browser
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
