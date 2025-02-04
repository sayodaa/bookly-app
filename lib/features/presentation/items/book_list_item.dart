import 'package:bookly_app/core/utils/constant_images.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.widthSize});
  final double widthSize;
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
          child: Image.asset(AssetsImages.testImage),
        ),
      ),
    );
  }
}
