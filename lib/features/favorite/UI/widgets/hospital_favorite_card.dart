import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';

class HospitalFavoriteCard extends StatelessWidget {
  final Hospital hospital;
  final VoidCallback onFavoriteToggle;

  const HospitalFavoriteCard({
    super.key,
    required this.hospital,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(hospital.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          // Hospital Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hospital.name, style: TextStyles.font16BlackNormal),
                  verticalSpace(4),
                  Row(
                    children: [
                      Image.asset(
                        Assets.assetsImagesLocation,
                        width: 16,
                        height: 16,
                      ),
                      horizontalSpace(4),
                      Expanded(
                        child: Text(
                          hospital.address,
                          style: TextStyles.font12lightGrayNormal,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Image.asset(
                        Assets.assetsImagesFavoriteStar,
                        width: 16,
                        height: 16,
                      ),
                      horizontalSpace(4),
                      Text(
                        hospital.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      horizontalSpace(12),
                      const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 16,
                      ),
                      horizontalSpace(4),
                      Text(
                        hospital.workingHours,
                        style: TextStyles.font14LightBlackNormal.copyWith(fontSize: 11),
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
              hospital.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: hospital.isFavorite ? Colors.red : Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
