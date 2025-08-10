import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/confirm_appointment/UI/widgets/confirm_appointment_view_body.dart';

class ConfirmAppointmentView extends StatelessWidget {
  const ConfirmAppointmentView({super.key});
  static const String routeName = '/confirm-appointment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConfirmAppointmentViewBody());
  }
}
