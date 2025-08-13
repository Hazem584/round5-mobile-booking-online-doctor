import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/repo/specialties_repo.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/custom_bottom_navigation_bar.dart';
import '../../../core/di/dependency_injection.dart';
import '../../booking/presentaion/screens/book_screen.dart';
import '../../profile/UI/profile_view.dart';
import '../domain/repo/doctor_repo.dart';
import 'bloc/doctors/doctor_cubit.dart';
import 'bloc/specailties/specialties_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorCubit(getIt<DoctorRepo>()),),
        BlocProvider(create: (context) => SpecialtiesCubit(getIt<SpecialtiesRepo>()),),
      ],
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
