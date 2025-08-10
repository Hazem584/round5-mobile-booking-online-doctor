import 'package:get_it/get_it.dart';
import 'package:online_booking_with_doctor/features/home/data/datasource/doctor_remote_data_source.dart';
import 'package:online_booking_with_doctor/features/home/data/datasource/doctor_remote_data_source_impl.dart';
import 'package:online_booking_with_doctor/features/home/data/repo/doctor_repo_impl.dart';
import 'package:online_booking_with_doctor/features/home/domain/repo/doctor_repo.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerSingleton<DoctorRemoteDataSource>(DoctorsRemoteDataSourceImpl());
  getIt.registerSingleton<DoctorRepo>(DoctorRepoImpl(doctorRemoteDataSource: getIt<DoctorRemoteDataSource>()));
}