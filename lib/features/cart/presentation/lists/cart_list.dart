import 'package:bookly_app/features/cart/manager/cubit/cart_cubit.dart';
import 'package:bookly_app/features/cart/presentation/widgets/cart_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(book: state.items[index]);
            },
            itemCount: state.items.length,
          );
        }
        else if (state is CartEmpty) {
          return Center(child: Text('Cart is empty'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
