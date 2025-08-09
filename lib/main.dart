import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/service/bloc_observer.dart';
import 'package:mobile_booking_online_doctor/core/service/get_it.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_router.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();
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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
        fontFamily: 'Montserrat',
      ),
    );
  }
}
