import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/search/presentaion/cubit/search_doctors_cubit.dart';

import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_list_of_doctors.dart';

class DoctorsSpecialtyViewBody extends StatelessWidget {
  const DoctorsSpecialtyViewBody({super.key, required this.specialty});
  final String specialty;
  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().search(query: specialty);
    return Scaffold(
      appBar: CustomAppbar(title: specialty,),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          switch(state){
            case SearchLoading():
              return Center(child: CircularProgressIndicator(),);
            case SearchSuccess():
              if(state.doctors.isEmpty){
                return Center(child: Text('Not Found!'),);
              }else{
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListOfDoctors(doctors: state.doctors, itemCount: state.doctors.length,),
                );
              }
            case SearchError():
              return Center(child: Text('Not Found!'),);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
