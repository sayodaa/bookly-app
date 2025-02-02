import 'package:bookly_app/core/utils/constant_images.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      child: AspectRatio(
        aspectRatio: 2/4,
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
