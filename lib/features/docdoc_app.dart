import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/routes/app_router.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/features/notifications/logic/cubit/notifications_cubit.dart';
// Updated docdoc_app.dart


class DocDocApp extends StatelessWidget {
 
  const DocDocApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add NotificationsCubit to app level
        BlocProvider(
          create: (context) => getIt<NotificationsCubit>(),
        ),
        // Add other BlocProviders here if you have them
        // BlocProvider(
        //   create: (context) => getIt<AuthCubit>(),
        // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'DocDoc App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Montserrat",
              scaffoldBackgroundColor: Colors.white,
            ),
            initialRoute: Routes.notifications,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}