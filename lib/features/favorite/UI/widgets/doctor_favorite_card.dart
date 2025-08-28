import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class DoctorFavoriteCard extends StatelessWidget {
  final DoctorModel doctor;
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
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(doctor.image),
                  fit: BoxFit.cover,
                ),
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
                    '${doctor.specialtyNameEn} | ${doctor.hospitalName}',
                    style: TextStyles.font12lightGrayNormal,
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
                        style: TextStyles.font12lightGrayNormal,
                      ),
                      horizontalSpace(12),
                      const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 16,
                      ),
                      horizontalSpace(4),
                      Expanded(
                        child: Text(
                          doctor.availableTime,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font14LightBlackNormal.copyWith(fontSize: 12),
                        ),
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
              doctor.isFav ? Icons.favorite : Icons.favorite_border,
              color: doctor.isFav ? Colors.red : Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
