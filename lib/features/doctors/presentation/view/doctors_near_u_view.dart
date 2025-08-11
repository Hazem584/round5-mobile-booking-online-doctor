import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/doctors/presentation/view/widgets/doctors_near_u_view_body.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../home/domain/repo/doctor_repo.dart';
import '../../../home/view/bloc/doctor_cubit.dart';


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
