import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/api_client/api_client.dart';
import 'core/di/dependency_injection.dart';
import 'core/network/api_service.dart';
import 'core/routes/app_router.dart';
import 'core/service/bloc_observer.dart';
import 'core/token/token_provider.dart';
import 'features/auth/login/data/repositories/phone_login_repository.dart';
import 'features/auth/login/logic/cubit/login_cubit.dart';
import 'features/auth/signup/logic/signup_cubit.dart';
import 'features/home/view/home_view.dart';
import 'features/notifications/logic/cubit/notifications_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = BlocObserverService();
  await setupGetIt();
  ApiClient.I.init(
    baseUrl: 'https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api',
    tokenProvider: StaticTokenProvider('YOUR_TOKEN_HERE'),
  );
  runApp(const DocDocApp());
}

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add NotificationsCubit to app level
        BlocProvider(create: (context) => getIt<NotificationsCubit>()),
        // Add other BlocProviders here if you have them
        // BlocProvider(
        //   create: (context) => getIt<AuthCubit>(),
        // ),
        BlocProvider(create: (context) => getIt<SignupCubit>()),
        BlocProvider(
          create: (context) => LoginWithPhoneCubit(
          PhoneLoginRepository(apiService: ApiService()),
    ),
        ),],
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
            initialRoute: HomeView.routeName,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
