import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_list_of_doctors.dart';
import '../../../../home/view/widgets/custom_search_text_fiield.dart';
import '../../../../home/view/widgets/specialties_listview.dart';
import '../../../../search/presentaion/view/search_view.dart';

class DoctorsNearUViewBody extends StatelessWidget {
  DoctorsNearUViewBody({super.key, required this.specialties, required this.doctors});

  final List<SpecialtyEntity> specialties;
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Doctors',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomSearchTextFiled(
              onTap: (){
                Navigator.pushNamed(context, SearchView.routeName, arguments: specialties);
              }, readOnly: true,
            ),
            SizedBox(height: 16,),
            SpecialtiesListView(specialties: specialties),
            SizedBox(height: 16,),
            Expanded(
              child: ListOfDoctors(doctors: doctors,)
            ),
          ],
        ),
      ),
    );
  }
}
