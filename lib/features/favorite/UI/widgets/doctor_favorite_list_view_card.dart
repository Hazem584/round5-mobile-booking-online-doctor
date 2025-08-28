import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';
import 'doctor_favorite_card.dart';

class DoctorsListWidget extends StatelessWidget {
  final List<DoctorModel> favoriteDoctors;
  final Function(int) onFavoriteToggle;

  const DoctorsListWidget({
    super.key,
    required this.favoriteDoctors,
    required this.onFavoriteToggle,
  });

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