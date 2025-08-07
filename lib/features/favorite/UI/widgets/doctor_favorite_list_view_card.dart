import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/doctor_favorite_card.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';

class DoctorsListWidget extends StatelessWidget {
  final List<Doctor> favoriteDoctors;
  final Function(int) onFavoriteToggle;

  const DoctorsListWidget({
    Key? key,
    required this.favoriteDoctors,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: favoriteDoctors.length,
      itemBuilder: (context, index) {
        return DoctorFavoriteCard(
          doctor: favoriteDoctors[index],
          onFavoriteToggle: () => onFavoriteToggle(index),
        );
      },
    );
  }
}