import 'package:bookly_app/features/logic/search/searh_cubit.dart';
import 'package:bookly_app/features/presentation/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSearchView extends StatelessWidget {
  const ListSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearhCubit, SearhState>(
      builder: (context, state) {
        if (state is SearhSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return SearchItem(
                book: state.books[index],
              );
            },
            itemCount: state.books.length,
          );
        }else if(state is SearhFailure){
          return SliverToBoxAdapter(child: Text(state.message));
        }else{
          return SliverToBoxAdapter(child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
