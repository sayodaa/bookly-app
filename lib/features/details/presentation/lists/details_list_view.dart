import '../../../../core/utils/app_route.dart';
import '../../manager/similler/simeller_books_cubit.dart';
import '../../../home/presentation/widgets/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimellerBooksCubit, SimellerBooksState>(
      builder: (context, state) {
        if (state is SimellerBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRouter.kDetailsView, extra: state.books[index]);
                    },
                    child: BookListItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                      widthSize: MediaQuery.of(context).size.width * 0.24,
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          );
        } else if (state is SimellerBooksFailure) {
          return Text(state.errmessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
