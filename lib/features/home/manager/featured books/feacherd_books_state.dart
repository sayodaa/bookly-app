part of 'feacherd_books_cubit.dart';

sealed class FeacherdBooksState extends Equatable {
  const FeacherdBooksState();

  @override
  List<Object> get props => [];
}

final class FeacherdBooksInitial extends FeacherdBooksState {}

final class FeacherdBooksLoading extends FeacherdBooksState {}

final class FeacherdBooksSuccess extends FeacherdBooksState {
  final List<BookModel> books;
  const FeacherdBooksSuccess(this.books);
}

final class FeacherdBooksFailure extends FeacherdBooksState {
  final String errmessage;
  const FeacherdBooksFailure({required this.errmessage});
}
