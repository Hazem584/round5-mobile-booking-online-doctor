import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mobile_booking_online_doctor/core/di/dependency_injection.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/custom_specialty_card.dart';
import 'package:mobile_booking_online_doctor/features/search/data/datasource/search%20history/search_histoy_data_source_impl.dart';
import 'package:mobile_booking_online_doctor/features/search/presentaion/view/widgets/search_history_item.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../../home/view/widgets/custom_search_text_fiield.dart';
import '../../../../specialties/presentation/view/doctors_specialty_view.dart';
import '../../cubit/search_doctors_cubit.dart';

class SearchViewBody extends StatefulWidget {
  SearchViewBody({super.key, required this.specialties});

   final List<SpecialtyEntity> specialties;

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
   final searchBox = getIt<SearchHistoryDataSource>();

   TextEditingController controller = TextEditingController();

   @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
                controller: controller,
                onChange: (value){
                  if(value.toString().trim().isEmpty){
                    context.read<SearchCubit>().search(query: value.toString().trim());
                  }
                },
                onSubmitted: (value){
                  searchBox.saveSearch(value);
                  context.read<SearchCubit>().search(query: value.toString().trim());
                },
              ),
              const SizedBox(height: 16,),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
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
                              widget.specialties.length,
                              (i) => GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: widget.specialties[i].nameEn,);
                                },
                                child: CustomSpecialtyCard(specialties: widget.specialties[i])
                              )
                            ).toList(),
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('History',style: TextStyles.medium18,),
                              TextButton(
                                onPressed: (){
                                  searchBox.clearHistory();
                                }, child: Text('clear', style: TextStyles.regular14.copyWith(color: ColorsManger.lightPrimaryColor))
                              )
                            ],
                          ),
                          const SizedBox(height: 16,),
                          ValueListenableBuilder(
                            valueListenable: searchBox.listenable(),
                              builder: (context , Box<String> boxBuilder,_) {
                                final history = boxBuilder.values.toList();
                                return Wrap(
                                  children: List.generate(
                                    history.length, (i) => GestureDetector(
                                      onTap: (){
                                        controller.text = history[i];
                                        context.read<SearchCubit>().search(query: controller.text.trim());
                                      },
                                      child: SearchHistoryItem(history: history[i])
                                    ),
                                  ).toList(),
                                );
                              }
                            ),
                        ],
                      ),
                    );
                  }else if (state is SearchLoading){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height *.7 ,
                      child: const Center(child: CircularProgressIndicator(),)
                    );
                  }else if (state is SearchSuccess){
                    return ListOfDoctors(
                      itemCount: state.doctors.length,
                      doctors: state.doctors,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    );
                  }else if (state is SearchError){
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