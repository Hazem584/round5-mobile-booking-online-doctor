import 'package:dio/dio.dart';
import '../models/doctor_model.dart';
import 'doctor_remote_data_source.dart';

class DoctorsRemoteDataSourceImpl implements DoctorRemoteDataSource{
  Dio dio = Dio();

  @override
  Future<List<DoctorModel>> fetchDoctors() async{
    try {
      Response response = await dio.get('https://68945a7ebe3700414e12d292.mockapi.io/doctors');
      if(response.statusCode == 200){
        final List data = response.data;
        return data.map((e)=> DoctorModel.fromJson(e)).toList();
      }else{
        throw Exception('Failed to load the Doctors');
      }
    } on Exception catch (e) {
      throw Exception('Response Failed');
    }
  }

}