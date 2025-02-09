import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/customs/custtom_search.dart';
import 'package:bookly_app/features/presentation/views/list_search_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: CustomSearch()),
        SliverToBoxAdapter(
            child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Search result', style: Styles.textStyle18),
        )),
        const ListSearchView(),
      ]),
    );
  }
}
