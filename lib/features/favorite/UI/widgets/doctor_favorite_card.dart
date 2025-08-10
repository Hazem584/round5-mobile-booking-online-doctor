import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';

class DoctorFavoriteCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onFavoriteToggle;

  const DoctorFavoriteCard({
    super.key,
    required this.doctor,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(doctor.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name, style: TextStyles.font16BlackNormal),
                  verticalSpace(4),
                  Text(
                    '${doctor.specialty} | ${doctor.hospital}',
                    style: TextStyles.font14lightGrayNormal,
                  ),
                  verticalSpace(5),
                  Row(
                    children: [
                      Image.asset(
                        Assets.assetsImagesFavoriteStar,
                        width: 16,
                        height: 16,
                      ),
                      horizontalSpace(4),
                      Text(
                        doctor.rating.toString(),
                        style: TextStyles.font14lightGrayNormal,
                      ),
                      horizontalSpace(12),
                      const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 16,
                      ),
                      horizontalSpace(4),
                      Text(
                        doctor.workingHours,
                        style: TextStyles.font14LightBlackNormal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Favorite Button
          IconButton(
            onPressed: onFavoriteToggle,
            icon: Icon(
              doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: doctor.isFavorite ? Colors.red : Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
