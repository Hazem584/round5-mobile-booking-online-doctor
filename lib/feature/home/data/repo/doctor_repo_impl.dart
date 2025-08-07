import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/feature/home/data/datasource/doctor_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/entities/doctor_entity.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/repo/doctor_repo.dart';

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