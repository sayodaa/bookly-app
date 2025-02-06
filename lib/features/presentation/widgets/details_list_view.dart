import 'package:bookly_app/features/presentation/items/book_list_item.dart';
import 'package:flutter/material.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: BookListItem(
              imageUrl: 'https://www.androidcoding.in/wp-content/uploads/flutter_image_picker-1022x1024.png',
              widthSize: MediaQuery.of(context).size.width * 0.24,
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
