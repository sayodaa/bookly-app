import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/customs/custom_app_bar.dart';
import 'package:bookly_app/features/presentation/items/best_seller_item.dart';
import 'package:bookly_app/features/presentation/lists/list_of_items.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomAppBar(),
          ListOfItems(),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: const Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
          ),
        ]),
      ),
      const BestSellerListView(),
    ]);
  }
}

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return BestSellerItem();
      },
      itemCount: 10,
    );
  }
}
