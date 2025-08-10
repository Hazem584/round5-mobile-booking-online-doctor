import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_appbar.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_list_of_doctors.dart';
import 'package:online_booking_with_doctor/feature/specialties/presentation/cubit/doctors_specialty_cubit.dart';

class DoctorsSpecialtyViewBody extends StatelessWidget {
  const DoctorsSpecialtyViewBody({super.key, required this.specialty});
  final String specialty;
  @override
  Widget build(BuildContext context) {
    context.read<DoctorsSpecialtyCubit>().loadDoctorsBySpecialty(specialty);
    return Scaffold(
      appBar: CustomAppbar(title: specialty,),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListOfDoctors(state: state, itemCount: state.doctors.length),
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
