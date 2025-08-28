import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/di/dependency_injection.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/service/bloc_observer.dart';
import 'features/notifications/logic/cubit/notifications_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox<String>('search_history');
  Bloc.observer = BlocObserverService();
  await setupGetIt();
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
