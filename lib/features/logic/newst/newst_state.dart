part of 'newst_cubit.dart';

sealed class NewstState extends Equatable {
  const NewstState();

  @override
  List<Object> get props => [];
}

final class NewstInitial extends NewstState {}

final class NewstLoading extends NewstState {}

final class NewstSuccess extends NewstState {
  final List<BookModel> books;
  const NewstSuccess(this.books);
}
final class NewstFailure extends NewstState {
  final String errmessage;
  const NewstFailure({required this.errmessage});
}