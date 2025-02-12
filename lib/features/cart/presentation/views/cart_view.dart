import 'package:bookly_app/features/cart/presentation/lists/cart_list.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      body: CartList(),
    ));
  }
}
