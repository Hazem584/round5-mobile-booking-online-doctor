import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/service/get_ir.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_router.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
    );
  }
}
