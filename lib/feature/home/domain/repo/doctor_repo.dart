import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/entities/doctor_entity.dart';

abstract class DoctorRepo{
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
}