import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/app_routes.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp( DocDocApp(appRouter: AppRoutes()));
}

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key, required this.appRouter});
  final AppRoutes appRouter;

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
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.reviews,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
