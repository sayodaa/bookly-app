import 'package:bookly_app/features/cart/presentation/views/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: CartViewBody(),
    ));
  }
}
