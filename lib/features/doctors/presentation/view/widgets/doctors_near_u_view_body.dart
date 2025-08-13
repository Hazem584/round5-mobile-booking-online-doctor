import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../../home/view/bloc/doctors/doctor_cubit.dart';
import '../../../../home/view/widgets/custom_search_text_fiield.dart';
import '../../../../home/view/widgets/specialties_listview.dart';
import '../../../../search/presentaion/view/search_view.dart';

class DoctorsNearUViewBody extends StatelessWidget {
  DoctorsNearUViewBody({super.key, required this.specialties});

  final List<SpecialtyEntity> specialties;

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
