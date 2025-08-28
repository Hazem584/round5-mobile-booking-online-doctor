import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/search/domain/repos/search_repo.dart';
import 'package:mobile_booking_online_doctor/features/search/presentaion/view/widgets/search_view_body.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/search_doctors_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.specialties});

  static const routeName = 'search';
  final List<SpecialtyEntity> specialties;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt<SearchRepo>()),
      child: SearchViewBody(specialties: specialties,),
    );
  }
}
