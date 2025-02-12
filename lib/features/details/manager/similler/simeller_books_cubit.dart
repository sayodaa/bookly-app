import 'package:bloc/bloc.dart';
import '../../../../core/data/models/book_model/book_model.dart';
import '../../../../core/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'simeller_books_state.dart';

class SimellerBooksCubit extends Cubit<SimellerBooksState> {
  SimellerBooksCubit(this.homeRepo,{required this.books, required String category}) : super(SimellerBooksInitial());

  final HomeRepo homeRepo;

  List<BookModel> books;

  Future<void> fetchSimellerBooksData({required String category}) async {
    emit(SimellerBooksLoading());
    final result = await homeRepo.fetchSimellerBooksData(category: category);
    result.fold((failure) => emit(SimellerBooksFailure(failure.toString())),
        (books) => this.books = books);
    emit(SimellerBooksSuccess(books));
  }
}
