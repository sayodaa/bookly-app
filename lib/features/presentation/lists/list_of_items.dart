import 'package:bookly_app/core/utils/app_route.dart';
import 'package:bookly_app/features/logic/featured%20books/feacherd_books_cubit.dart';
import 'package:bookly_app/features/presentation/items/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeacherdBooksCubit, FeacherdBooksState>(
      builder: (context, state) {
        if (state is FeacherdBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: state.books[index]);
                    },
                    child: BookListItem(
                      imageUrl: state.books.isNotEmpty
                          ? state.books[index].volumeInfo.imageLinks.thumbnail
                          : 'https://www.androidcoding.in/wp-content/uploads/flutter_image_picker-1022x1024.png',
                      widthSize: MediaQuery.of(context).size.width * 0.42,
                    ),
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeacherdBooksFailure) {
          return Text(state.errmessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
