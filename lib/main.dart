import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/docdoc_app.dart';
import 'package:online_booking_with_doctor/core/routes/app_router.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupNotificationsDependencies();
  runApp(DocDocApp());
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
