import 'styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment, required this.rate, required this.index});
  final MainAxisAlignment? mainAxisAlignment;
  final num rate;
  final num index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
         Text(
           '$rate',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($index)',
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
