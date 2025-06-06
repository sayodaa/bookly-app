import '../../../../core/data/models/book_model/book_model.dart';
import '../../../../core/utils/book_rating.dart';
import '../../../../core/utils/custom_book_image.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/url_luncher.dart';
import '../lists/details_list_view.dart';
import '../widgets/custom_details_appbar.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
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
                  CustomDetailsImage(
                    imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle18,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      bookModel.volumeInfo.infoLink![0],
                      style: Styles.textStyle14.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookRating(
                    index: bookModel.volumeInfo.pageCount ?? 0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    rate: bookModel.volumeInfo.pageCount ?? 0,
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
                          child: CustomTextButton(
                            topLeft: 10,
                            bottomLeft: 10,
                            color: Colors.white,
                            textColor: Colors.black,
                            text:
                                '${bookModel.volumeInfo.pageCount.toString()} \$',
                          ),
                        ),
                        Expanded(
                          child: CustomTextButton(
                            onPressed: () {
                              launchCustomUrl(
                                context: context,
                                urlString: bookModel.volumeInfo.infoLink!,
                              );
                            },
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
                  IconButton(
                    onPressed: () {
                      showCustomDialog(context,bookModel);
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                      color: Colors.white,
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
