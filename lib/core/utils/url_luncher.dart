import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchCustomUrl({required String urlString}) async {
  final url = Uri.parse(urlString);
  if (await launcher.canLaunchUrl(url)) {
    await launcher.launchUrl(url);
  }
}
