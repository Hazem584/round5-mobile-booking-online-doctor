import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/bloc/doctor_cubit.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_search_text_fiield.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctor_card_item.dart';
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
      appBar: AppBar(
        title: Text('Doctors'),
        centerTitle: true,
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          switch(state){
            case DoctorLoading():
              return Center(child: CircularProgressIndicator(),);
            case DoctorSuccess():
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    CustomSearchTextFiled(
                      onTap: (){
                        Navigator.pushNamed(context, SearchView.routeName);
                      }, readOnly: true,
                    ),
                    SizedBox(height: 16,),
                    SpecialtiesListView(specialties: specialties),
                    SizedBox(height: 8,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.doctors.length,
                        itemBuilder: (context, i){
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: DoctorCardItem(
                                image: state.doctors[i].image,
                                name: state.doctors[i].name,
                                specialist: state.doctors[i].specialist,
                                location:state.doctors[i].location,
                                rating: state.doctors[i].rating,
                                time: state.doctors[i].availableTime
                            ),
                          );
                        }
                      ),
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
