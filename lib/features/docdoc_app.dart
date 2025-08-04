import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/app_routes.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';

class DocDocApp extends StatelessWidget {
  final AppRoutes appRouter;
  const DocDocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'DocDoc App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "NotoSansGeorgian",
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.reviews,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}