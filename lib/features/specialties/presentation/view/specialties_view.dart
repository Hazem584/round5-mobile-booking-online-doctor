import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/specialties/presentation/view/widget/specialties_view_body.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key, required this.specialties});

  static const routeName = 'specialties';
  final List<SpecialtyEntity> specialties;
  @override
  Widget build(BuildContext context) {
    return  SpecialtiesViewBody(specialties: specialties,);
  }
}
