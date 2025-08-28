import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

abstract class SpecialtiesRepo{
  Future<Either<Failure, List<SpecialtyEntity>>> getSpecialties();
}