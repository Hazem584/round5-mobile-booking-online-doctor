import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/on_genrate.dart';
import 'core/routes/app_routes.dart';
import 'feature/booking/presentaion/screens/book_screen.dart';
import 'feature/booking/presentaion/screens/doctor_details.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.myBooking,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),

      ),

    );
  }
}