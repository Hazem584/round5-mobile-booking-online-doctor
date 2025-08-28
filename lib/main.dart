import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/di/dependency_injection.dart';
import 'core/network/api_service.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/service/bloc_observer.dart';
import 'features/auth/login/data/repositories/phone_login_repository.dart';
import 'features/auth/login/logic/cubit/login_cubit.dart';
import 'features/auth/signup/logic/signup_cubit.dart';
import 'features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure ScreenUtil is initialized
  await ScreenUtil.ensureScreenSize();

  // Ensure Hive is initialized
  await Hive.initFlutter();
  await Hive.openBox<String>('search_history');

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
        BlocProvider(create: (context) => getIt<SignupCubit>()),
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(
          create: (context) => LoginWithPhoneCubit(
            PhoneLoginRepository(apiService: ApiService()),
          ),
        ),
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
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black,fontFamily: 'Georgia')
              )
            ),
            initialRoute: Routes.splash,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
