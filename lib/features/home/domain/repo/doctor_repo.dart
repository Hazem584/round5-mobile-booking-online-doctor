import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/doctor_entity.dart';

abstract class DoctorRepo{
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
}