  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:mobile_booking_online_doctor/core/routes/routes.dart';
  import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';
  import 'core/di/dependency_injection.dart';
  import 'core/routes/app_router.dart';
  import 'core/service/bloc_observer.dart';
  import 'features/notifications/logic/cubit/notifications_cubit.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Ensure ScreenUtil is initialized
    await ScreenUtil.ensureScreenSize();
    
    // Initialize BlocObserver
    Bloc.observer = BlocObserverService();
    
    // Initialize AuthManager early
    await AuthManager.initialize();
    
    // Setup dependency injection
    await setupGetIt();
    
    runApp(const DocDocApp());
  }

  class DocDocApp extends StatelessWidget {
    const DocDocApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final cubit = getIt<NotificationsCubit>();
              cubit.initialize();
              return cubit;
            },
          ),
          // Add other BlocProviders here if you have them
          // Example for AuthCubit (uncomment when you have it):
          // BlocProvider(
          //   create: (context) => getIt<AuthCubit>(),
          // ),
          // Example for HomeCubit (uncomment when you have it):
          // BlocProvider(
          //   create: (context) => getIt<HomeCubit>(),
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
                // Add some additional theme properties for consistency
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: Routes.splash,
              onGenerateRoute: AppRouter.generateRoute,
              // Add global navigation observers if needed
              // navigatorObservers: [
              //   // Add your navigation observers here
              // ],
            );
          },
        ),
      );
    }
  }