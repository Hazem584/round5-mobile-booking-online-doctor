import 'package:flutter/material.dart';

import '../../data/models/doctor_and_hospital_model.dart';
import 'doctor_favorite_card.dart';

class DoctorsListWidget extends StatelessWidget {
  final List<Doctor> favoriteDoctors;
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