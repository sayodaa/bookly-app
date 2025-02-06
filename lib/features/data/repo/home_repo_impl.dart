import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:bookly_app/features/data/services/services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  Services services;
  HomeRepoImpl( {
    required this.services,
  });
  @override
  Future<Either<Failuers, List<BookModel>>> fetchNewstBooksData() async {
    List<BookModel> books = [];
    try {
      services
          .get(
        endPoint: 'volumes?filtering=free-ebooks&q=programming&sorting=newst',
      )
          .then(
        (data) {
          for (var item in data['items']) {
            books.add(item);
          }
        },
      );
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
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData() async {
    List<BookModel> books = [];
    try {
      services
          .get(
        endPoint: 'volumes?filtering=free-ebooks&q=programming',
      )
          .then(
        (data) {
/*************  ✨ Codeium Command 🌟  *************/
          for (var item in data['items']) {
            books.add(BookModel.fromJson(item));
          }
/******  3041a2b5-79f4-4eba-b895-243941e79e76  *******/
        },
      );
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
}
