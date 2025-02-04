import 'package:bookly_app/features/presentation/items/best_seller_item.dart';
import 'package:flutter/material.dart';

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
