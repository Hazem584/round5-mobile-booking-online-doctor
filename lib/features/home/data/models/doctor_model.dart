import 'package:mobile_booking_online_doctor/core/constant/constant.dart';

import '../../domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.specialtyNameEn,
    required super.image,
    required super.location,
    required super.rating,
    required super.availableTime,
    required super.doctorProfileId,
    required super.email,
    required super.about,
    required super.phone,
    required super.specialtyId,
    required super.experienceYears,
    required super.specialtyDescription,
    required super.pricePerHour,
    required super.userId,
    required super.specialtyNameAr,
    required super.hospitalId,
    required super.hospitalName,
    required super.hospitalStartTime,
    required super.hospitalEndTime,
    required super.availabilityId,
    required super.day,
    required super.startTime,
    required super.endTime,
  });

  factory DoctorModel.fromDoctorEntity(DoctorEntity doctorEntity) {
    return DoctorModel(
      doctorProfileId: doctorEntity.doctorProfileId,
      name: doctorEntity.name,
      specialtyNameEn: doctorEntity.specialtyNameEn,
      image: doctorEntity.image,
      location: doctorEntity.location,
      rating: doctorEntity.rating,
      availableTime: doctorEntity.availableTime,
      email: doctorEntity.email,
      about: doctorEntity.about,
      phone: doctorEntity.phone,
      specialtyId: doctorEntity.specialtyId,
      experienceYears: doctorEntity.experienceYears,
      specialtyDescription: doctorEntity.specialtyDescription,
      pricePerHour: doctorEntity.pricePerHour,
      userId: doctorEntity.userId,
      specialtyNameAr: doctorEntity.specialtyNameAr,
      hospitalId: doctorEntity.hospitalId,
      hospitalName: doctorEntity.hospitalName,
      hospitalStartTime: doctorEntity.hospitalStartTime,
      hospitalEndTime: doctorEntity.hospitalEndTime,
      availabilityId: doctorEntity.availabilityId,
      day: doctorEntity.day,
      startTime: doctorEntity.startTime,
      endTime: doctorEntity.endTime,
    );
  }

  factory DoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return DoctorModel(
      doctorProfileId: jsonData['doctor_profile_id'],
      name: jsonData['name'],
      email: jsonData['email'] ?? '',
      about: jsonData['about'] ?? '',
      phone: jsonData['phone'] ?? '',
      specialtyId: jsonData['specialty_id'] ?? 0,
      experienceYears: jsonData['experience_years'] ?? 0,
      specialtyNameEn: jsonData['specialty_name_en'] ?? '',
      specialtyDescription: jsonData['specialty_description'] ?? '',
      image: jsonData['image'] ?? Constant.defaultImage,
      location: jsonData['location'] ?? "El-Nasr Hospital",
      rating: jsonData['rating'] ?? "4.8",
      availableTime: jsonData['availableTime'] ?? "9:30am - 8:00pm",
      pricePerHour: jsonData['price_per_hour'] ?? '0.00',
      userId: jsonData['user_id'] ?? 0,
      specialtyNameAr: jsonData['specialty_name_ar'] ?? '',
      hospitalId: jsonData['hospital_id'] ?? 0,
      hospitalName: jsonData['hospital_name'] ?? '',
      hospitalStartTime: jsonData['hospital_start_time'] ?? '',
      hospitalEndTime: jsonData['hospital_end_time'] ?? '',
      availabilityId: jsonData['availability_id'] ?? 0,
      day: jsonData['day'] ?? '',
      startTime: jsonData['start_time'] ?? '',
      endTime: jsonData['end_time'] ?? '',
    );
  }
}
