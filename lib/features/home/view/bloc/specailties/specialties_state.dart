part of 'specialties_cubit.dart';

@immutable
sealed class SpecialtiesState {}

final class SpecialtiesInitial extends SpecialtiesState {}
final class SpecialtiesLoading extends SpecialtiesState {}
final class SpecialtiesSuccess extends SpecialtiesState {
  final List<SpecialtyEntity> specialties;

  SpecialtiesSuccess({required this.specialties});
}
final class SpecialtiesError extends SpecialtiesState {
  final String message;

  SpecialtiesError({required this.message});
}
