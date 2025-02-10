import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close_rounded,
          ),
        ),
        IconButton(
            onPressed: () async {
              final Uri url =
                  Uri.parse('https://pub.dev/packages/url_launcher');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: Icon(Icons.shopping_cart))
      ],
    );
  }
}
