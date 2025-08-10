part of 'doctors_specialty_cubit.dart';

@immutable
sealed class DoctorsSpecialtyState {}

final class DoctorsSpecialtyInitial extends DoctorsSpecialtyState {}
final class DoctorsSpecialtyLoading extends DoctorsSpecialtyState {}
final class DoctorsSpecialtySuccess extends DoctorsSpecialtyState {
  final List<DoctorEntity> doctors;

  DoctorsSpecialtySuccess({required this.doctors});
}
final class DoctorsSpecialtyError extends DoctorsSpecialtyState {
  final String message;

  DoctorsSpecialtyError({required this.message});
}
