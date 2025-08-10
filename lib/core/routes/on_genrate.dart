import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/routes/app_routes.dart';

import '../../feature/appoinment/appoinment_screen.dart';
import '../../feature/booking/presentaion/screens/book_screen.dart';
import '../../feature/doctor_details/presentaion/screen/doctor_details.dart';
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.doctorDetails:
      return MaterialPageRoute(
        builder: (_) => const DoctorDetailsPage(),
      );

    case AppRoutes.myBooking:
      return MaterialPageRoute(
        builder: (_) => const BookScreen(),
      );
    case AppRoutes.appointment:
      return MaterialPageRoute(
        builder: (_) => const AppointmentPage(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('404 - Page Not Found')),
        ),
      );
  }
}
