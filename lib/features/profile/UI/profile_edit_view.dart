import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/di/dependency_injection.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/profile_edit_view_body.dart';
import 'package:mobile_booking_online_doctor/features/profile/logic/cubit/profile_cubit.dart';

class ProfileEditView extends StatelessWidget {
  static const String routeName = '/profile-edit';

  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<ProfileCubit>();
        // Load profile data when the screen is opened
        cubit.getProfileData();
        return cubit;
      },
      child: const ProfileEditViewBody(),
    );
  }
}