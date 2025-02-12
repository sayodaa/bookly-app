import '../models/book_model/book_model.dart';
import '../../errors/failuers.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData();
  Future<Either<Failuers, List<BookModel>>> fetchNewstBooksData();
  Future<Either<Failuers, List<BookModel>>> fetchSimellerBooksData({required String category});
  Future<Either<Failuers, List<BookModel>>> searchBooks({required String query});
  Future<Either<Failuers, List<BookModel>>> fetchCartItems();
  Future<Either<Failuers, void>> addToCart(BookModel book);
  Future<Either<Failuers, void>> removeFromCart(BookModel book);
}
