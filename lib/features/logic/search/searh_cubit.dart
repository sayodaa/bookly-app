import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'searh_state.dart';

class SearhCubit extends Cubit<SearhState> {
  SearhCubit(this.homeRepo) : super(SearhInitial());
  final HomeRepo homeRepo;
  Future<void> searchBooks({required String query}) async {
    emit(SearhLoading(message: 'Searching for $query'));
      final either = await homeRepo.searchBooks(query: query);
      either.fold(
        (failure) => emit(SearhFailure(message: failure.toString())),
        (books) => emit(SearhSuccess(books: books)),
      );
  }
}
