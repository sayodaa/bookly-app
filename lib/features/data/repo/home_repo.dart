import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuers, List<BookModel>>> fetchNewstBooksData();
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData();
}
