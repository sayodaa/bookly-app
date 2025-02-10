part of 'searh_cubit.dart';

sealed class SearhState extends Equatable {
  const SearhState();

  @override
  List<Object> get props => [];
}

final class SearhInitial extends SearhState {}

final class SearhLoading extends SearhState {
  final String message;
  const SearhLoading({required this.message});
}

final class SearhSuccess extends SearhState {
  final List<BookModel> books;
  const SearhSuccess({required this.books});
}

final class SearhFailure extends SearhState {
  final String message;
  const SearhFailure({required this.message});
}
