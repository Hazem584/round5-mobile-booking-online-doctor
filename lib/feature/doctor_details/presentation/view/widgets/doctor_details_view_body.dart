import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_appbar.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Doctor details',),
      body: Center(
        child: Text('Doctor'),
      ),
    );
  }
}
