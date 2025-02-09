import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchCustomUrl({required String urlString, required BuildContext context}) async {
  final url = Uri.parse(urlString);
  if (await launcher.canLaunchUrl(url)) {
    await launcher.launchUrl(url);
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can\'t open this link $urlString')),
      );
    }
  }
}
