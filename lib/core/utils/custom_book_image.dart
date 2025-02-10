import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomDetailsImage extends StatelessWidget {
  const CustomDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
