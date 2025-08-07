import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/doctor_card_item.dart';
import 'package:mobile_booking_online_doctor/feature/specialties/presentation/cubit/doctors_specialty_cubit.dart';

class DoctorsSpecialtyViewBody extends StatelessWidget {
  const DoctorsSpecialtyViewBody({super.key, required this.specialty});
  final String specialty;
  @override
  Widget build(BuildContext context) {
    context.read<DoctorsSpecialtyCubit>().loadDoctorsBySpecialty(specialty);
    return Scaffold(
      appBar: AppBar(
        title: Text(specialty),
        centerTitle: true,
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<DoctorsSpecialtyCubit, DoctorsSpecialtyState>(
        builder: (context, state) {
          switch(state){
            case DoctorsSpecialtyLoading():
              return Center(child: CircularProgressIndicator(),);
            case DoctorsSpecialtySuccess():
              if(state.doctors.isEmpty){
                return Center(child: Text('Not Found!'),);
              }else{
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: ListView.builder(
                      itemCount: state.doctors.length,
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
                  ),
                );
              }
            case DoctorsSpecialtyError():
              return Center(child: Text('Not Found!'),);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
