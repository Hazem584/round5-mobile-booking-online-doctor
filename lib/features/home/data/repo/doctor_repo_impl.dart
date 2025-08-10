import 'package:dartz/dartz.dart';
import 'package:online_booking_with_doctor/core/error/failure.dart';
import 'package:online_booking_with_doctor/features/home/data/datasource/doctor_remote_data_source.dart';
import 'package:online_booking_with_doctor/features/home/domain/entities/doctor_entity.dart';
import 'package:online_booking_with_doctor/features/home/domain/repo/doctor_repo.dart';

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