import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../../home/view/widgets/custom_search_text_fiield.dart';
import '../../../../home/view/widgets/specialties_listview.dart';
import '../../../../specialties/presentation/view/doctors_specialty_view.dart';
import '../../cubit/search_doctors_cubit.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key, required this.specialties});

   final List<SpecialtyEntity> specialties;

   List<String> history = [
     'Psychiatrist', 'Robert Johnson', 'Helwan', 'Heart doctor',
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Search',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomSearchTextFiled(
                onChange: (value){
                  context.read<SearchDoctorsCubit>().searchDoctors(value.toString().trim());
                },
              ),
              const SizedBox(height: 16,),
              BlocBuilder<SearchDoctorsCubit, SearchDoctorsState>(
                builder: (context, state) {
                  if (state is SearchDoctorsInitial) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Search by your location ', style: TextStyles.regular13,),
                              Text('129,El-Nasr Street, Cairo', style: TextStyles.regular11.copyWith(color: ColorsManger.lightPrimaryColor),),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Text('All Specialties',style: TextStyles.medium18,),
                          const SizedBox(height: 16,),
                          Wrap(
                            runSpacing: 8,
                            children: List.generate(
                              specialties.length,
                              (i) => GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: specialties[i].name,);
                                },
                                child: CustomSpecialtyCard(specialties: specialties[i])
                              )
                            ).toList(),
                          ),
                          const SizedBox(height: 16,),
                          Text('History',style: TextStyles.medium18,),
                          const SizedBox(height: 16,),
                          Wrap(
                            children: List.generate(
                              history.length,
                              (i) => Padding(
                                padding: const EdgeInsets.only(right:8.0, bottom: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        width: 1,
                                        color: ColorsManger.borderColor
                                    )
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(history[i],style: TextStyles.regular14),
                                    ],
                                  ),
                                ),
                              )
                            ).toList(),
                          ),
                        ],
                      ),
                    );
                  }else if (state is SearchDoctorsLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }else if (state is SearchDoctorsSuccess){
                    return ListOfDoctors(
                      state: state,
                      itemCount: state.doctors.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    );
                  }else if (state is SearchDoctorsError){
                    return Center(child: Text('Not Found'),);
                  }else {return SizedBox();}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
