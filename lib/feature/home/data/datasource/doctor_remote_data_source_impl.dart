import 'dart:convert';
import 'package:mobile_booking_online_doctor/feature/home/data/models/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'doctor_remote_data_source.dart';

class DoctorsRemoteDataSourceImpl implements DoctorRemoteDataSource{
  @override
  Future<List<DoctorModel>> fetchDoctors() async{
    try {
      http.Response response = await http.get(Uri.parse('https://68945a7ebe3700414e12d292.mockapi.io/doctors'));
      if(response.statusCode == 200){
        final List data = jsonDecode(response.body);
        return data.map((e)=> DoctorModel.fromJson(e)).toList();
      }else{
        throw Exception('Failed to load the Doctors');
      }
    } on Exception catch (e) {
      throw Exception('Response Failed');
    }
  }

}