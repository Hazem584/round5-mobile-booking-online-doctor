import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/utils/routes.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_router.dart';

void main() {
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.addNewCardView,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Montserrat"),
      ),
    );
  }
}
