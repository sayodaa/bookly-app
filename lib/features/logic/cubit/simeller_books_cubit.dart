import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'simeller_books_state.dart';

class SimellerBooksCubit extends Cubit<SimellerBooksState> {
  SimellerBooksCubit(this.homeRepo) : super(SimellerBooksInitial());

  final HomeRepo homeRepo;

  List<BookModel> books = [];

  Future<void> fetchSimellerBooksData({required String category}) async {
    emit(SimellerBooksLoading());
    final result = await homeRepo.fetchSimellerBooksData(category: category);
    result.fold((failure) => emit(SimellerBooksFailure(failure.toString())),
        (books) => this.books = books);
    emit(SimellerBooksSuccess(books));
  }
}
