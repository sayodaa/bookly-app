part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}
class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartUpdated extends CartState {
  final List<BookModel> items;
  const CartUpdated(this.items);

  @override
  List<Object> get props => [items];
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);

  @override
  List<Object> get props => [message];
}

class CartEmpty extends CartState {}
