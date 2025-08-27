import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<DoctorEntity>>> getSearchResult({
    required String query,
  });
}