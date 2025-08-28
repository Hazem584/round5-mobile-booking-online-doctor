import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/search/domain/repos/search_repo.dart';
import 'package:mobile_booking_online_doctor/features/search/presentaion/cubit/search_doctors_cubit.dart';
import 'package:mobile_booking_online_doctor/features/specialties/presentation/view/widget/doctors_specialty_view_body.dart';

import '../../../../core/di/dependency_injection.dart';

class DoctorsSpecialtyView extends StatelessWidget {
  const DoctorsSpecialtyView({super.key, required this.specialty});

  final String specialty;
  static const routeName = 'doctors specialty';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt<SearchRepo>()),
      child: DoctorsSpecialtyViewBody(specialty: specialty,),
    );
  }
}
