import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/app_route.dart';
import 'package:bookly_app/features/cart/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showCustomDialog(BuildContext context, BookModel book) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // حواف مستديرة
        ),
        title: const Text(
          "Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Are you sure you want to add this book to your cart?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق النافذة
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Cancel"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              // ✅ إضافة الكتاب إلى السلة
              BlocProvider.of<CartCubit>(context).addToCart(book);

              // ✅ إغلاق نافذة التأكيد
              Navigator.of(context).pop();

              // ✅ الذهاب إلى صفحة السلة
              GoRouter.of(context).push(AppRouter.kCartView);

              // ✅ إظهار رسالة نجاح
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Book added to cart successfully!"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Confirm"),
          ),
        ],
      );
    },
  );
}
