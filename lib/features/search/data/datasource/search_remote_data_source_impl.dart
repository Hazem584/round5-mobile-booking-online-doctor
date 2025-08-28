import 'package:dio/dio.dart';
import 'package:mobile_booking_online_doctor/core/constant/constant.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';
import 'package:mobile_booking_online_doctor/features/search/data/datasource/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  Dio dio = Dio();
  @override
  Future<List<DoctorModel>> fetchSearchResult({required String query}) async{
    try {
      Response response = await dio.get(
        'https://round5-online-booking-with-doctor-api.huma-volve.com/api/doctors/search?query=$query',
        options: Options(
          headers: {
            'Authorization' : 'Bearer ${Constant.token}',
          }
        )
      );

      if(response.statusCode == 200){
        final List data = response.data['data'];
        return data.map((e)=> DoctorModel.fromJson(e)).toList();
      }else{
        throw Exception('Failed to load the result');
      }
    } on Exception {
      throw Exception('Response Failed');
    }
  }
}