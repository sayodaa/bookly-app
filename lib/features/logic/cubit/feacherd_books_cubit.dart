import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/data/services/services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'feacherd_books_state.dart';

class FeacherdBooksCubit extends Cubit<FeacherdBooksState> {
  HomeRepoImpl homeRepoImpl = HomeRepoImpl(services: Services(dio: Dio()));
  FeacherdBooksCubit() : super(FeacherdBooksInitial());
  Future<void> fetchFeacherdBooks() async {
    emit(FeacherdBooksLoading());
    final result = await homeRepoImpl.fetchFeaturedData();
    result.fold((failure) {
      emit(FeacherdBooksFailure(failure.));
    }, (books) {
      emit(FeacherdBooksSuccess(books));
    });
  }
}
