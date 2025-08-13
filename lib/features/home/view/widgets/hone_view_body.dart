import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/view/bloc/specailties/specialties_cubit.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/doctor_card.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/specialties_listview.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../doctors/presentation/view/doctors_near_u_view.dart';
import '../../../search/presentaion/view/search_view.dart';
import '../../../specialties/presentation/view/specialties_view.dart';
import '../bloc/doctors/doctor_cubit.dart';
import 'custom_home_app_bar.dart';
import 'custom_search_text_fiield.dart';

class HoneViewBody extends StatefulWidget {
  HoneViewBody({super.key});

  @override
  State<HoneViewBody> createState() => _HoneViewBodyState();
}

class _HoneViewBodyState extends State<HoneViewBody> {

  @override
  void initState() {
    context.read<DoctorCubit>().loadDoctors();
    context.read<SpecialtiesCubit>().loadSpecialties();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, doctorsState) {
        return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
          builder: (context, specialtiesState) {
            if (doctorsState is DoctorLoading ||
                specialtiesState is SpecialtiesLoading){
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
              appBar: CustomHomeAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomSearchTextFiled(
                        onTap: () {
                          Navigator.pushNamed(context, SearchView.routeName,
                            arguments: specialtiesState is SpecialtiesSuccess
                              ? specialtiesState.specialties
                              : [],
                          );
                        },
                        readOnly: true,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Specialties',
                            style: TextStyles.regular20.copyWith(
                              fontFamily: 'Georgia',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SpecialtiesView.routeName,
                                arguments:
                                  specialtiesState is SpecialtiesSuccess
                                  ? specialtiesState.specialties
                                  : [],
                              );
                            },
                            child: Text(
                              'View all',
                              style: TextStyles.regular14.copyWith(
                                color: ColorsManger.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SpecialtiesListView(
                        specialties: specialtiesState is SpecialtiesSuccess
                            ? specialtiesState.specialties
                            : [],
                      ),
                      const SizedBox(height: 16),
                      DoctorCard(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Doctors near you',
                            style: TextStyles.regular20.copyWith(
                              fontFamily: 'Georgia',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                DoctorsNearUView.routeName,
                                arguments: specialtiesState is SpecialtiesSuccess
                                    ? specialtiesState.specialties
                                    : [],
                              );
                            },
                            child: Text(
                              'View all',
                              style: TextStyles.regular14.copyWith(
                                color: ColorsManger.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (doctorsState is DoctorSuccess)
                        ListOfDoctors(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          state: doctorsState,
                          itemCount: 5,
                        )
                      else if (doctorsState is DoctorError)
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: const Center(child: Text('Not Found!')),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
