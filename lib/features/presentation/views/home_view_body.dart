import 'package:bookly_app/features/customs/custom_app_bar.dart';
import 'package:bookly_app/features/presentation/items/book_list_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        BookListItem(),
      ],
    );
  }
}
