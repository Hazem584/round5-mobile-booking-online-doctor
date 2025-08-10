import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/feature/doctor_details/presentation/view/widgets/doctor_details_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key,});

  static const routeName = "doctor details";

  @override
  Widget build(BuildContext context) {
    return DoctorDetailsViewBody();
  }
}
