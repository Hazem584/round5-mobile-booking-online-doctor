import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/features/doctors/presentation/view/widgets/doctors_near_u_view_body.dart';
import 'package:online_booking_with_doctor/features/home/domain/repo/doctor_repo.dart';
import 'package:online_booking_with_doctor/features/home/view/bloc/doctor_cubit.dart';


class DoctorsNearUView extends StatelessWidget {
  const DoctorsNearUView({super.key});

  static const routeName = 'doctors';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(getIt<DoctorRepo>()),
      child: DoctorsNearUViewBody(),
    );
  }
}
