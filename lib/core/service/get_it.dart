import 'package:get_it/get_it.dart';
import 'package:mobile_booking_online_doctor/feature/home/data/datasource/doctor_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/feature/home/data/datasource/doctor_remote_data_source_impl.dart';
import 'package:mobile_booking_online_doctor/feature/home/data/repo/doctor_repo_impl.dart';
import 'package:mobile_booking_online_doctor/feature/home/domain/repo/doctor_repo.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerSingleton<DoctorRemoteDataSource>(DoctorsRemoteDataSourceImpl());
  getIt.registerSingleton<DoctorRepo>(DoctorRepoImpl(doctorRemoteDataSource: getIt<DoctorRemoteDataSource>()));
}