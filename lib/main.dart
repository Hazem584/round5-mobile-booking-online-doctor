import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/routes/app_router.dart';
import 'package:online_booking_with_doctor/core/service/bloc_observer.dart';
import 'package:online_booking_with_doctor/core/service/get_it.dart';
import 'package:online_booking_with_doctor/features/home/view/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = BlocObserverService();
  setupGetIt();
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeView.routeName,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            titleTextStyle: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
