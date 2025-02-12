import 'package:flutter/material.dart';

import '../lists/cart_list.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Cart'),
          Expanded(
            child: CartList(),
          ),
        ],
      ),
    );
  }
}
