import 'package:news/models/news_model/news_model.dart';
import 'package:news/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunction {
  static Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
