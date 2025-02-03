import 'package:bookly_app/core/utils/constant_images.dart';
import 'package:flutter/material.dart';

class CustomDetailsImage extends StatelessWidget {
  const CustomDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.37,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(AssetsImages.testImage),
      ),
    );
  }
}
