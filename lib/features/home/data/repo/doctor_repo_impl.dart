import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/repo/doctor_repo.dart';
import '../datasource/doctor_remote_data_source.dart';

class DoctorRepoImpl implements DoctorRepo{
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepoImpl({required this.doctorRemoteDataSource});
  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async{
    try{
      List<DoctorEntity> list = await doctorRemoteDataSource.fetchDoctors();
      return right(list);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}