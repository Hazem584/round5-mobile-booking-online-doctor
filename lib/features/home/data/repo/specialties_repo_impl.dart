import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/features/home/data/datasource/specialty_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/repo/specialties_repo.dart';

class SpecialtiesRepoImpl implements SpecialtiesRepo{
  final SpecialtyRemoteDataSource specialtyRemoteDataSource;

  SpecialtiesRepoImpl({required this.specialtyRemoteDataSource});

  @override
  Future<Either<Failure, List<SpecialtyEntity>>> getSpecialties() async{
    try {
      List<SpecialtyEntity> list = await specialtyRemoteDataSource.fetchSpecialties();
      return right(list);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}