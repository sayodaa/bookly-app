part of 'simeller_books_cubit.dart';

sealed class SimellerBooksState extends Equatable {
  const SimellerBooksState();

  @override
  List<Object> get props => [];
}

final class SimellerBooksInitial extends SimellerBooksState {}

final class SimellerBooksLoading extends SimellerBooksState {}

final class SimellerBooksSuccess extends SimellerBooksState {
  final List<BookModel> books;
  const SimellerBooksSuccess(this.books);
}

final class SimellerBooksFailure extends SimellerBooksState {
  final String errmessage;
  const SimellerBooksFailure(this.errmessage);
}
