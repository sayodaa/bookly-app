import '../../../../core/data/models/book_model/book_model.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/book_rating.dart';
import '../../../../core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: book);
      },
      child: SizedBox(
        child: Row(
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
                    child: CachedNetworkImage(
                      imageUrl: book.volumeInfo.imageLinks.thumbnail,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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
                      book.volumeInfo.title??'',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle18,
                    ),
                  ),
                  Text(
                    book.volumeInfo.categories?[0]??'',
                    style: Styles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle25,
                      ),
                      BookRating(
                        rate: book.volumeInfo.pageCount!,
                        index: book.volumeInfo.pageCount!,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
