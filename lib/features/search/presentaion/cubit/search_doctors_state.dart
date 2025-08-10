part of 'search_doctors_cubit.dart';

@immutable
sealed class SearchDoctorsState {}

final class SearchDoctorsInitial extends SearchDoctorsState {}
final class SearchDoctorsLoading extends SearchDoctorsState {}
final class SearchDoctorsSuccess extends SearchDoctorsState {
  final List<DoctorEntity> doctors;

  SearchDoctorsSuccess({required this.doctors});
}

final class SearchDoctorsError extends SearchDoctorsState {
  final String message;

  SearchDoctorsError({required this.message});
}
