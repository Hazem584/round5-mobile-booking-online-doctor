import 'package:dartz/dartz.dart';
import 'package:mobile_booking_online_doctor/core/error/failure.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';
import 'package:mobile_booking_online_doctor/features/search/data/datasource/search_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<DoctorEntity>>> getSearchResult({required String query,}) async{
    try {
      List<DoctorEntity> list = await searchRemoteDataSource.fetchSearchResult(
          query: query,
      );
      return right(list);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}