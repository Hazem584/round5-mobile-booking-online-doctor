import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/specialties/presentation/view/widget/specialties_view_body.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key});

  static const routeName = 'specialties';
  @override
  Widget build(BuildContext context) {
    return  SpecialtiesViewBody();
  }
}
