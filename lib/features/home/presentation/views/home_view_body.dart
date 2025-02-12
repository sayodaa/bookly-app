import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/lists/best_seller_list.dart';
import 'package:bookly_app/features/home/presentation/lists/list_of_items.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomAppBar(),
          ListOfItems(),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: const Text(
              'Newst Books',
              style: Styles.textStyle18,
            ),
          ),
        ]),
      ),
      const BestSellerListView(),
    ]);
  }
}
