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
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
