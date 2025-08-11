import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileViewBody());
  }
}
