import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/customs/custom_details_appbar.dart';
import 'package:bookly_app/features/customs/custom_text_button.dart';
import 'package:bookly_app/features/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/presentation/widgets/custom_book_image.dart';
import 'package:bookly_app/features/presentation/widgets/details_list_view.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomDetailsAppBar(),
                  const CustomDetailsImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
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
                  const SizedBox(
                    height: 10,
                  ),
                  const BookRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: const CustomTextButton(
                            topLeft: 10,
                            bottomLeft: 10,
                            color: Colors.white,
                            textColor: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: const CustomTextButton(
                            topRight: 10,
                            bottomRight: 10,
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            fontWeight: FontWeight.normal,
                            text: 'Free Preview',
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: const SizedBox(
                      height: 15,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('You Can Also Like', style: Styles.textStyle14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DetailsListView()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
