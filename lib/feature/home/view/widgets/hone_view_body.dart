import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/doctors/presentation/view/doctors_near_u_view.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/bloc/doctor_cubit.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_search_text_fiield.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctor_card.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctor_card_item.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialties_listview.dart';
import 'package:mobile_booking_online_doctor/feature/search/presentaion/view/search_view.dart';
import 'package:mobile_booking_online_doctor/feature/specialties/presentation/view/specialties_view.dart';

class HoneViewBody extends StatelessWidget {
   HoneViewBody({super.key});
  List<Map> specialties = [
    {'icon': 'assets/icons/Dentist.svg', 'specialty': 'Dentist'},
    {'icon': 'assets/icons/Cardiologist.svg', 'specialty': 'Cardiologist'},
    {'icon': 'assets/icons/General-Practitioner.svg', 'specialty': 'General Practitioner',},
    {'icon': 'assets/icons/ENT.svg', 'specialty': 'ENT'},
    {'icon': 'assets/icons/Orthopedic.svg', 'specialty': 'Orthopedic'},
    {'icon': 'assets/icons/Neurologist.svg', 'specialty': 'Neurologist'},
    {'icon': 'assets/icons/Pulmonologist.svg', 'specialty': 'Pulmonologist'},
    {'icon': 'assets/icons/Ophthalmologist.svg', 'specialty': 'Ophthalmologist',},
    {'icon': 'assets/icons/Psychiatrist.svg', 'specialty': 'Psychiatrist'},
    {'icon': 'assets/icons/Endocrinologist.svg', 'specialty': 'Endocrinologist',},
    {'icon': 'assets/icons/Gastroenterologist.svg', 'specialty': 'Gastroenterologist',},
  ];
  @override
  Widget build(BuildContext context) {
    context.read<DoctorCubit>().loadDoctors();
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchTextFiled(
                onTap: (){
                  Navigator.pushNamed(context, SearchView.routeName);
                },
                readOnly: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Specialties', style: AppStyle.regular20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SpecialtiesView.routeName);
                    },
                    child: Text(
                      'View all',
                      style: AppStyle.regular14.copyWith(color: AppColors.primaryColor),
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
                  Text('Doctors near you', style: AppStyle.regular20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DoctorsNearUView.routeName);
                    },
                    child: Text(
                      'View all',
                      style: AppStyle.regular14.copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  switch(state){
                    case DoctorLoading():
                      return Center(child: CircularProgressIndicator(),);
                    case DoctorSuccess():
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, i){
                          return DoctorCardItem(
                            image: state.doctors[i].image,
                            name: state.doctors[i].name,
                            specialist: state.doctors[i].specialist,
                            location:state.doctors[i].location,
                            rating: state.doctors[i].rating,
                            time: state.doctors[i].availableTime
                          );
                        }
                      );
                    case DoctorError():
                      return Center(child: Text('Not Found!'),);
                    default:
                      return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}


