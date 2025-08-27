import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';

abstract class SearchRemoteDataSource{
  Future<List<DoctorModel>> fetchSearchResult({
    required String query,
  });
}