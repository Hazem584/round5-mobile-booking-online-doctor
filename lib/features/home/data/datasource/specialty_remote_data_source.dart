import 'package:mobile_booking_online_doctor/features/home/data/models/specialty_model.dart';

abstract class SpecialtyRemoteDataSource{
  Future<List<SpecialtyModel>> fetchSpecialties();
}