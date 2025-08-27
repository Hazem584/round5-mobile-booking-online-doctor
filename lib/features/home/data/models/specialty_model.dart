import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

class SpecialtyModel extends SpecialtyEntity {
  SpecialtyModel({
    required super.icon,
    required super.nameEn,
    required super.nameAr,
    required super.description,
    required super.id,
  });

  factory SpecialtyModel.fromEntity(SpecialtyEntity specialtyEntity) {
    return SpecialtyModel(
      icon: specialtyEntity.icon,
      nameEn: specialtyEntity.nameEn,
      nameAr: specialtyEntity.nameAr,
      description: specialtyEntity.description,
      id: specialtyEntity.id,
    );
  }

  factory SpecialtyModel.fromJson(Map<String, dynamic> jsonData) {
    return SpecialtyModel(
      icon: 'assets/icons/${jsonData['name_en']}.svg',
      nameEn: jsonData['name_en'],
      nameAr: jsonData['name_ar'],
      description: jsonData['description'],
      id: jsonData['id'],
    );
  }
}
