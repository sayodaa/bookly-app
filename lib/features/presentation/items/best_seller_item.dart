import 'package:bookly_app/core/utils/constant_images.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/presentation/widgets/book_rating.dart';
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(AssetsImages.testImage),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Harry Potter and the sorcerer\'s stone',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18,
                ),
              ),
              Text(
                'J.K. Rowling',
                style: Styles.textStyle14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '19.99 \$',
                    style: Styles.textStyle25,
                  ),
                  BookRating()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
