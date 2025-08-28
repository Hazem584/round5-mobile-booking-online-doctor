import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_booking_online_doctor/core/constant/constant.dart';
import 'package:mobile_booking_online_doctor/core/di/dependency_injection.dart';
import 'package:mobile_booking_online_doctor/features/favorite/data/data%20source/favorite_remote_data_source.dart';
import '../models/doctor_model.dart';
import 'doctor_remote_data_source.dart';

class DoctorsRemoteDataSourceImpl implements DoctorRemoteDataSource{
  Dio dio = Dio();

  @override
  Future<List<DoctorModel>> fetchDoctors() async{
    try {
      Response response = await dio.get(
          'https://round5-online-booking-with-doctor-api.huma-volve.com/api/doctors',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Constant.token}',
          },
        )
      );
      if(response.statusCode == 200){
        final List data = response.data['data'];
        List<DoctorModel> doctorsList = data.map((e)=> DoctorModel.fromJson(e)).toList();

        final Set favIds = getIt<FavoriteLocalDataSource>().favIds;
        for (var doctor in doctorsList) {
          if (favIds.contains(doctor.doctorProfileId)) {
            doctor.isFav = true;
          }
        }

        return doctorsList;
      }else{
        log(response.statusMessage.toString());
        throw Exception('Failed to load the Doctors');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw Exception('Response Failed');
    }
  }

}