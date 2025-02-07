import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:bookly_app/features/data/services/services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final Services services;
  
  HomeRepoImpl({required this.services});

  @override
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData() {
    return _fetchBooks('volumes?filtering=free-ebooks&q=cmputer science');
  }

  @override
  Future<Either<Failuers, List<BookModel>>> fetchNewstBooksData() {
    return _fetchBooks('volumes?filtering=free-ebooks&q=programming&sorting=newst');
  }

  Future<Either<Failuers, List<BookModel>>> _fetchBooks(String endPoint) async {
    try {
      final data = await services.get(endPoint: endPoint);
      
      final List<BookModel> books = (data['items'] as List<dynamic>)
          .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
          .toList();
          
      return Right(books);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      if (e is DioException) {
        return Left(ServerFailuers.fromDioError(e));
      }
      return Left(ServerFailuers(e.toString()));
    }
  }
  
  @override
  Future<Either<Failuers, List<BookModel>>> fetchSimellerBooksData({required String category}) {
   return _fetchBooks('volumes?filtering=free-ebooks&q=cmputer science&sorting=relevance');
  }
}
