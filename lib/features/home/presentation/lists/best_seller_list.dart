import '../../manager/newst/newst_cubit.dart';
import '../widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstCubit, NewstState>(
      builder: (context, state) {
        if (state is NewstSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return BestSellerItem(
                book: state.books[index],
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is NewstFailure) {
          return SliverToBoxAdapter(child: Text(state.errmessage));
        } else {
          return SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
