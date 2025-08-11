import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/specialties/presentation/view/widget/doctors_specialty_view_body.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../home/domain/repo/doctor_repo.dart';
import '../cubit/doctors_specialty_cubit.dart';

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
