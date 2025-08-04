import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_home_appBar.dart.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctorAd_widget.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctors_list.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/search_bar_widget.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialties_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: ListView(
        children: [
          SearchBarWidget(),
          SpecialtiesSection(),
          DoctordWidget(),
          DoctorsList(),
        ],
      ),
    );
  }
}
