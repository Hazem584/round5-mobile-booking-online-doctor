import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialties_listview.dart';

class SpecialtiesViewBody extends StatelessWidget {
   SpecialtiesViewBody({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialties'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 8,
          children: List.generate(
            specialties.length,
            (i) => CustomSpecialtyCard(specialties: specialties[i])
          ).toList()
        ),
      ),
    );
  }
}
