import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/core/routes/app_routes.dart';
import 'package:online_booking_with_doctor/features/docdoc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupNotificationsDependencies();
  runApp(DocDocApp(appRouter: AppRoutes()));
}