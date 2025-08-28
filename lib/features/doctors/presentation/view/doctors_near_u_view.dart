import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/doctors/presentation/view/widgets/doctors_near_u_view_body.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

class DoctorsNearUView extends StatelessWidget {
  const DoctorsNearUView({super.key, required this.specialties, required this.doctors});

  static const routeName = 'doctors';
  final List<SpecialtyEntity> specialties;
  final List<DoctorEntity> doctors;
  @override
  Widget build(BuildContext context) {
    return DoctorsNearUViewBody(specialties: specialties, doctors: doctors);
  }
}
