import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/data/repo/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final HomeRepoImpl homeRepoImpl;
  List<BookModel> cartItems = [];

  CartCubit(this.homeRepoImpl) : super(CartInitial()) {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedCart = prefs.getString('cartItems');

    if (savedCart != null) {
      final List decodedBooks = json.decode(savedCart);
      cartItems = decodedBooks.map((book) => BookModel.fromJson(book)).toList();
      emit(CartUpdated(List.from(cartItems)));
    }
  }

  Future<void> _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List encodedBooks = cartItems.map((book) => book.toJson()).toList();
    prefs.setString('cartItems', json.encode(encodedBooks));
  }

  void fetchCartItems() async {
    emit(CartLoading());
    await _loadCartItems();
  }

  void addToCart(BookModel book) async {
    if (!cartItems.contains(book)) {
      cartItems.add(book);
      emit(CartUpdated(List.from(cartItems)));
      await _saveCartItems();

      final result = await homeRepoImpl.addToCart(book);
      result.fold(
        (failure) {
          cartItems.remove(book);
          emit(CartError(failure.toString()));
        },
        (success) => emit(CartUpdated(List.from(cartItems))),
      );
    }
  }

  void removeFromCart(BookModel book) async {
    cartItems.remove(book);
    emit(CartUpdated(List.from(cartItems)));
    await _saveCartItems(); 

    final result = await homeRepoImpl.removeFromCart(book);
    result.fold(
      (failure) {
        cartItems.add(book);
        emit(CartError(failure.toString()));
      },
      (success) => emit(CartUpdated(List.from(cartItems))),
    );
  }
}
