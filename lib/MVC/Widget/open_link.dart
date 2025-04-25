import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLink {
  Future<void> launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('Lỗi', 'Không mở được link');
    }
  }
}
