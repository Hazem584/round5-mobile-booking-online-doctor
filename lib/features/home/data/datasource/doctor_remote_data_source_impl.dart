import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_booking_online_doctor/core/constant/constant.dart';
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
        return data.map((e)=> DoctorModel.fromJson(e)).toList();
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