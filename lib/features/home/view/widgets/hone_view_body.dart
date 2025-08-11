import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/doctor_card.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/specialties_listview.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../confirm_appointment/UI/widgets/doctor_card.dart';
import '../../../doctors/presentation/view/doctors_near_u_view.dart';
import '../../../search/presentaion/view/search_view.dart';
import '../../../specialties/presentation/view/specialties_view.dart';
import '../bloc/doctor_cubit.dart';
import 'custom_home_app_bar.dart';
import 'custom_search_text_fiield.dart';

class HoneViewBody extends StatelessWidget {
  HoneViewBody({super.key});
  List<Map> specialties = [
    {'icon': 'assets/icons/Dentist.svg', 'specialty': 'Dentist'},
    {'icon': 'assets/icons/Cardiologist.svg', 'specialty': 'Cardiologist'},
    {
      'icon': 'assets/icons/General-Practitioner.svg',
      'specialty': 'General Practitioner',
    },
    {'icon': 'assets/icons/ENT.svg', 'specialty': 'ENT'},
    {'icon': 'assets/icons/Orthopedic.svg', 'specialty': 'Orthopedic'},
    {'icon': 'assets/icons/Neurologist.svg', 'specialty': 'Neurologist'},
    {'icon': 'assets/icons/Pulmonologist.svg', 'specialty': 'Pulmonologist'},
    {
      'icon': 'assets/icons/Ophthalmologist.svg',
      'specialty': 'Ophthalmologist',
    },
    {'icon': 'assets/icons/Psychiatrist.svg', 'specialty': 'Psychiatrist'},
    {
      'icon': 'assets/icons/Endocrinologist.svg',
      'specialty': 'Endocrinologist',
    },
    {
      'icon': 'assets/icons/Gastroenterologist.svg',
      'specialty': 'Gastroenterologist',
    },
  ];
  @override
  Widget build(BuildContext context) {
    context.read<DoctorCubit>().loadDoctors();
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchTextFiled(
                onTap: () {
                  Navigator.pushNamed(context, SearchView.routeName);
                },
                readOnly: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Specialties',
                    style: TextStyles.regular20.copyWith(fontFamily: 'Georgia'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SpecialtiesView.routeName);
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
              SpecialtiesListView(specialties: specialties),
              const SizedBox(height: 16),
              DoctorCard(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctors near you',
                    style: TextStyles.regular20.copyWith(fontFamily: 'Georgia'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DoctorsNearUView.routeName);
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
              BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  switch (state) {
                    case DoctorLoading():
                      return Center(child: CircularProgressIndicator());
                    case DoctorSuccess():
                      return ListOfDoctors(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        state: state,
                        itemCount: 5,
                      );
                    case DoctorError():
                      return Center(child: Text('Not Found!'));
                    default:
                      return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
