part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}
final class DoctorLoading extends DoctorState {}
final class DoctorSuccess extends DoctorState {
  final List<DoctorEntity> doctors;

  DoctorSuccess({required this.doctors});
}
final class DoctorError extends DoctorState {
  final String message;

  DoctorError({required this.message});
}
