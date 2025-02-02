import 'package:bookly_app/features/presentation/items/book_list_item.dart';
import 'package:flutter/material.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BookListItem(),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
