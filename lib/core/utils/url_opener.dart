import 'package:url_launcher/url_launcher.dart';

class UrlOpener {
  UrlOpener._();

  static Future<void> call(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  static Future<void> whatsapp(String phone) async {
    final uri = Uri(scheme: 'https', path: 'wa.me/$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
    }
  }
}
