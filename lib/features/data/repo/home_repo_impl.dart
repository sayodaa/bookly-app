import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failuers, List<BookModel>>> fetchBestSellerData() {
    // TODO: implement fetchBestSellerData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuers, List<BookModel>>> fetchFeaturedData() {
    // TODO: implement fetchFeaturedData
    throw UnimplementedError();
  }
}