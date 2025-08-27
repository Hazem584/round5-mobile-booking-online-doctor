import 'package:dio/dio.dart';
import 'package:mobile_booking_online_doctor/core/constant/constant.dart';
import 'package:mobile_booking_online_doctor/features/home/data/datasource/specialty_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/specialty_model.dart';

class SpecialtyRemoteDataSourceImpl implements SpecialtyRemoteDataSource{
  Dio dio = Dio();
  @override
  Future<List<SpecialtyModel>> fetchSpecialties() async{
    try {
      Response response = await dio.get(
          'https://round5-online-booking-with-doctor-api.huma-volve.com/api/specialities',
        options: Options(
          headers: {
            'Authorization' : 'Bearer ${Constant.token}',
          }
        )
      );
      if(response.statusCode == 200){
        final List data = response.data['data'];
        return data.map((e)=> SpecialtyModel.fromJson(e)).toList();
      }else{
        throw Exception('Failed to load the Doctors');
      }
    } on Exception {
      throw Exception('Response Failed');
    }
  }
}