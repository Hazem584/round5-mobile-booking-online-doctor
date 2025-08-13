import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

class SpecialtyModel extends SpecialtyEntity{
  SpecialtyModel({required super.icon, required super.name});

  factory SpecialtyModel.fromEntity(SpecialtyEntity specialtyEntity){
    return SpecialtyModel(icon: specialtyEntity.icon, name: specialtyEntity.name);
  }

  factory SpecialtyModel.fromJson(Map<String, dynamic> jsonData){
    return SpecialtyModel(icon: 'assets/icons/${jsonData['name']}.svg', name: jsonData['name']);
  }
}