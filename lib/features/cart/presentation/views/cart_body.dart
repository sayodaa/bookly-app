import 'package:bookly_app/features/cart/presentation/lists/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Cart'),
          Expanded(
            child: CartViewBody(),
          ),
        ],
      ),
    );
  }
}
