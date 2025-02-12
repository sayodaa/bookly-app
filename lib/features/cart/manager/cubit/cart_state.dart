part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}
class CartInitial extends CartState {}
// 🟡 عند بدء تحميل بيانات السلة
class CartLoading extends CartState {}

// 🟢 عندما يتم تحميل البيانات بنجاح
class CartUpdated extends CartState {
  final List<BookModel> items;
  const CartUpdated(this.items);

  @override
  List<Object> get props => [items];
}

// 🔴 عند حدوث خطأ
class CartError extends CartState {
  final String message;
  const CartError(this.message);

  @override
  List<Object> get props => [message];
}

// ⚪️ عندما تكون السلة فارغة
class CartEmpty extends CartState {}
