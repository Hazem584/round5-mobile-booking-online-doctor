import 'package:dartz/dartz.dart';
import 'package:online_booking_with_doctor/core/error/failure.dart';
import 'package:online_booking_with_doctor/features/home/domain/entities/doctor_entity.dart';

abstract class DoctorRepo{
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
}