import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/on_genrate.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/app_colors.dart';

void main() {
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DocApp',
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppRoutes.myBooking,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
      ),
    );
  }
}
