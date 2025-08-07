import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/specialties/presentation/view/widget/specialties_view_body.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key});

  static const routeName = 'specialties';
  @override
  Widget build(BuildContext context) {
    return  SpecialtiesViewBody();
  }
}
