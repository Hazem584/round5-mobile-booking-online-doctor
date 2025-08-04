import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_home_appBar.dart.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/search_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomHomeAppBar(), body: SearchBarWidget());
  }
}
