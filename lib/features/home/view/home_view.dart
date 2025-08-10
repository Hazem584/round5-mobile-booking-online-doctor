import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/features/booking/presentaion/screens/book_screen.dart';
import 'package:online_booking_with_doctor/features/home/view/bloc/doctor_cubit.dart';
import 'package:online_booking_with_doctor/features/home/view/widgets/custom_home_app_bar.dart';
import 'package:online_booking_with_doctor/features/home/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';
import '../domain/repo/doctor_repo.dart';
import 'widgets/hone_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    _currentIndex = index;
    setState(() {});
  }

  final List<Widget> _pages = [HoneViewBody(), BookScreen(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(getIt<DoctorRepo>()),
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}
