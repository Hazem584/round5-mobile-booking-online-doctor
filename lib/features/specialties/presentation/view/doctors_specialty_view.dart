import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/features/home/domain/repo/doctor_repo.dart';
import 'package:online_booking_with_doctor/features/specialties/presentation/cubit/doctors_specialty_cubit.dart';
import 'package:online_booking_with_doctor/features/specialties/presentation/view/widget/doctors_specialty_view_body.dart';

import '../../../../core/service/get_it.dart';

class DoctorsSpecialtyView extends StatelessWidget {
  const DoctorsSpecialtyView({super.key, required this.specialty});

  final String specialty;
  static const routeName = 'doctors specialty';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsSpecialtyCubit(getIt<DoctorRepo>()),
      child: DoctorsSpecialtyViewBody(specialty: specialty,),
    );
  }
}
