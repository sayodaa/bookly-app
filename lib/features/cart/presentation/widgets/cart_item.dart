import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/book_rating.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/utils/url_luncher.dart';
import 'package:bookly_app/features/cart/manager/cubit/cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          launchCustomUrl(urlString: book.volumeInfo.infoLink ?? '', context: context);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              // 📌 صورة الكتاب
              SizedBox(
                width: 90,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: book.volumeInfo.imageLinks.thumbnail,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // 📌 معلومات الكتاب
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.volumeInfo.title ?? "No Title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.volumeInfo.categories?.first ?? "Unknown Category",
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 📌 سعر الكتاب (إذا كان مدفوعًا، غير "Free")
                        Text(
                          'Free',
                          style: Styles.textStyle25.copyWith(color: Colors.green),
                        ),
                        // 📌 تقييم الكتاب
                        BookRating(
                          rate: book.volumeInfo.pageCount ?? 0,
                          index: book.volumeInfo.pageCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // 📌 زر الحذف من السلة
              IconButton(
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).removeFromCart(book);
                },
                icon: const Icon(Icons.remove_shopping_cart_outlined, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
