import 'package:bookly_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close_rounded,
          ),
        ),
        IconButton(
            onPressed: (){
              GoRouter.of(context).push(AppRouter.kCartView);
            },
            icon: Icon(Icons.shopping_cart))
      ],
    );
  }
}
