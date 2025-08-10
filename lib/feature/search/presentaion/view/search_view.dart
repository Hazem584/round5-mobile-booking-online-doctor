import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/service/get_it.dart';
import 'package:online_booking_with_doctor/feature/home/domain/repo/doctor_repo.dart';
import 'package:online_booking_with_doctor/feature/search/presentaion/cubit/search_doctors_cubit.dart';
import 'package:online_booking_with_doctor/feature/search/presentaion/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchDoctorsCubit(getIt<DoctorRepo>()),
      child: SearchViewBody(),
    );
  }
}
