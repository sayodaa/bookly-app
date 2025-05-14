import '../models/book_model/book_model.dart';
import 'home_repo.dart';
import '../services/service.dart';
import '../../errors/failuers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final Services services;

  HomeRepoImpl({required this.services});
  List<BookModel> cartBooks = [];

  @override
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData() {
    return _fetchBooks('volumes?filtering=free-ebooks&q=computer science');
  }

  @override
  Future<Either<Failuers, List<BookModel>>> fetchNewstBooksData() {
    return _fetchBooks(
        'volumes?filtering=free-ebooks&q=programming&sorting=newest');
  }

  @override
  Future<Either<Failuers, List<BookModel>>> fetchSimellerBooksData(
      {required String category}) {
    return _fetchBooks(
        'volumes?filtering=free-ebooks&q=computer science&sorting=relevance');
  }
  @override
  Future<Either<Failuers, List<BookModel>>> fetchCartItems() {
    return _fetchBooks('volumes?filtering=free-ebooks&q=computer science');
  }
 @override
Future<Either<Failuers, void>> addToCart(BookModel book) async {
  try {
    await Future.delayed(const Duration(milliseconds: 500));
    cartBooks.add(book);
    return const Right(null);
  } catch (e) {
    if (e is DioException) {
      return Left(ServerFailuers.fromDioError(e));
    }
    return Left(ServerFailuers(e.toString()));
  }
}
@override
Future<Either<Failuers, void>> removeFromCart(BookModel book) async {
  try {
    await Future.delayed(const Duration(milliseconds: 500));
    cartBooks.remove(book);
    return const Right(null);
  } catch (e) {
    if (e is DioException) {
      return Left(ServerFailuers.fromDioError(e));
    }
    return Left(ServerFailuers(e.toString()));
  }
}

  @override
  Future<Either<Failuers, List<BookModel>>> searchBooks(
      {required String query}) {
    return _fetchBooks('volumes?filtering=free-ebooks&q=$query');
  }
  Future<Either<Failuers, List<BookModel>>> _fetchBooks(String endPoint) async {
    try {
      final data = await services.get(endPoint: endPoint);

      final List<BookModel> books = (data['items'] as List<dynamic>)
          .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuers.fromDioError(e));
      }
      return Left(ServerFailuers(e.toString()));
    }
  }
}
