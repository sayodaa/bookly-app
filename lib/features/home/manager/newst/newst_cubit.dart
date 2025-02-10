import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newst_state.dart';

class NewstCubit extends Cubit<NewstState> {
  NewstCubit(this.homeRepo) : super(NewstInitial());
    final HomeRepo homeRepo;

  Future<void> fetchNewstBooksData() async {
    emit(NewstLoading());
    final either = await homeRepo.fetchNewstBooksData();
    either.fold(
        (failure) => emit(NewstFailure(errmessage: failure.toString())),
        (books) => emit(NewstSuccess(books)));
  }
}
