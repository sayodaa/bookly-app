import 'package:bookly_app/core/utils/constant_images.dart';
import 'package:bookly_app/core/utils/styls.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: AspectRatio(
            aspectRatio: 2 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AssetsImages.testImage),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '''Harry Potter 
and the sorcerer's stone''',
              style: Styles.textStyle18,
            ),
            Text(
              'J.K. Rowling',
              style: Styles.textStyle14,
            ),
            Row(
              children: [
                Text(
                  '19.99 \$',
                  style: Styles.textStyle20,
                ),
                Text(
                  '     ⭐(2390)',
                  style: Styles.textStyle14
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
