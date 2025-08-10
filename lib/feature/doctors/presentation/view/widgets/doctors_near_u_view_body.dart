import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_appbar.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_list_of_doctors.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/bloc/doctor_cubit.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_search_text_fiield.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialties_listview.dart';
import 'package:mobile_booking_online_doctor/feature/search/presentaion/view/search_view.dart';

class DoctorsNearUViewBody extends StatelessWidget {
  DoctorsNearUViewBody({super.key});

  List<Map> specialties = [
    {'icon': 'assets/icons/Dentist.svg', 'specialty': 'Dentist'},
    {'icon': 'assets/icons/Cardiologist.svg', 'specialty': 'Cardiologist'},
    {'icon': 'assets/icons/General-Practitioner.svg', 'specialty': 'General Practitioner',},
    {'icon': 'assets/icons/ENT.svg', 'specialty': 'ENT'},
    {'icon': 'assets/icons/Neurologist.svg', 'specialty': 'Neurologist'},
    {'icon': 'assets/icons/Ophthalmologist.svg', 'specialty': 'Ophthalmologist',},
    {'icon': 'assets/icons/Pulmonologist.svg', 'specialty': 'Pulmonologist'},
    {'icon': 'assets/icons/Psychiatrist.svg', 'specialty': 'Psychiatrist'},
    {'icon': 'assets/icons/Orthopedic.svg', 'specialty': 'Orthopedic'},
    {'icon': 'assets/icons/Endocrinologist.svg', 'specialty': 'Endocrinologist',},
    {'icon': 'assets/icons/Gastroenterologist.svg', 'specialty': 'Gastroenterologist',},
  ];

  @override
  Widget build(BuildContext context) {
    context.read<DoctorCubit>().loadDoctors();
    return Scaffold(
      appBar: CustomAppbar(title: 'Doctors',),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          switch(state){
            case DoctorLoading():
              return Center(child: CircularProgressIndicator(),);
            case DoctorSuccess():
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    CustomSearchTextFiled(
                      onTap: (){
                        Navigator.pushNamed(context, SearchView.routeName);
                      }, readOnly: true,
                    ),
                    SizedBox(height: 16,),
                    SpecialtiesListView(specialties: specialties),
                    SizedBox(height: 16,),
                    Expanded(
                      child: ListOfDoctors(state: state, itemCount: state.doctors.length)
                    ),
                  ],
                ),
              );
            case DoctorError():
              return Center(child: Text('Not Found!'),);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
