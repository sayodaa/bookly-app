import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feacherd_books_state.dart';

class FeacherdBooksCubit extends Cubit<FeacherdBooksState> {
  final HomeRepo homeRepo;
  FeacherdBooksCubit({required this.homeRepo}) : super(FeacherdBooksInitial());

  Future<void> fetchFeaturedData() async {
    emit(FeacherdBooksLoading());
    final either = await homeRepo.fetchFeaturedData();
    either.fold(
        (failure) => emit(FeacherdBooksFailure(errmessage: failure.toString())),
        (books) => emit(FeacherdBooksSuccess(books)));
  }
}
