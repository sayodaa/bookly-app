import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.widthSize, required this.imageUrl});
  final double widthSize;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      child: AspectRatio(
        aspectRatio: 2 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
        ),
      ),
    );
  }
}
