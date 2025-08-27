part of 'search_doctors_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<DoctorEntity> doctors;

  SearchSuccess({required this.doctors});
}

final class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
