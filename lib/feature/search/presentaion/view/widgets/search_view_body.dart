import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/custom_search_text_fiield.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialties_listview.dart';

class SearchViewBody extends StatelessWidget {
   SearchViewBody({super.key});

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

   List<String> history = [
     'Psychiatrist', 'Robert Johnson', 'Helwan', 'Heart doctor',
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextFiled(),
              const SizedBox(height: 16,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Search by your location ', style: AppStyle.regular13,),
                  Text('129,El-Nasr Street, Cairo', style: AppStyle.regular11.copyWith(color: AppColors.lightPrimaryColor),),
                ],
              ),
              const SizedBox(height: 16,),
              Text('All Specialties',style: AppStyle.medium18,),
              const SizedBox(height: 16,),
              Wrap(
                runSpacing: 8,
                children: List.generate(
                  specialties.length,
                  (i) => CustomSpecialtyCard(specialties: specialties[i])
                ).toList(),
              ),
              const SizedBox(height: 16,),
              Text('History',style: AppStyle.medium18,),
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
                            color: AppColors.borderColor
                        )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(history[i],style: AppStyle.regular14),
                        ],
                      ),
                    ),
                  )
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
