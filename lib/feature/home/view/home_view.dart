import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/service/get_ir.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/bloc/doctor_cubit.dart';
import '../domain/repo/doctor_repo.dart';
import 'widgets/hone_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(getIt<DoctorRepo>()),
      child: HoneViewBody(),
    );
  }
}
