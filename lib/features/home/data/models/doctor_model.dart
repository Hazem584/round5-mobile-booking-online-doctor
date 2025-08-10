import 'package:online_booking_with_doctor/features/home/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.specialist,
    required super.image,
    required super.location,
    required super.rating,
    required super.availableTime,
  });

  factory DoctorModel.fromDoctorEntity(DoctorEntity doctorEntity) {
    return DoctorModel(
      name: doctorEntity.name,
      specialist: doctorEntity.specialist,
      image: doctorEntity.image,
      location: doctorEntity.location,
      rating: doctorEntity.rating,
      availableTime: doctorEntity.availableTime,
    );
  }

  factory DoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DoctorModel(
      name: jsonData['name'],
      specialist: jsonData['specialist'],
      image: jsonData['image'],
      location: jsonData['location'],
      rating: jsonData['rating'],
      availableTime: jsonData['availableTime'],
    );
  }
}
