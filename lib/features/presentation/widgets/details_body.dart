import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/customs/custom_details_appbar.dart';
import 'package:bookly_app/features/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDetailsAppBar(),
        CustomDetailsImage(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Book Name here',
          style: Styles.textStyle18,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Author Name',
            style: Styles.textStyle14.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BookRating(),
      ],
    ));
  }
}
