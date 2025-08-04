import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/favorite_icon.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for doctors
    final List<Map<String, dynamic>> doctors = [
      {
        "name": "Robert Johnson",
        "specialty": "Orthopedic",
        "hospital": "El-Nasr Hospital",
        "rating": 4.8,
        "time": "9:30am - 8:00pm",
        "isFavorite": false,
        "imageUrl": "https://via.placeholder.com/100",
      },
      {
        "name": "Emma Watson",
        "specialty": "Cardiologist",
        "hospital": "Green Valley Clinic",
        "rating": 4.9,
        "time": "10:00am - 6:00pm",
        "isFavorite": true,
        "imageUrl": "https://via.placeholder.com/100",
      },
      {
        "name": "David Brown",
        "specialty": "Dermatologist",
        "hospital": "City Care Center",
        "rating": 4.7,
        "time": "11:00am - 7:00pm",
        "isFavorite": false,
        "imageUrl": "https://via.placeholder.com/100",
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Doctors near you', style: AppStyle.georgia22),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: AppStyle.georgiaNormal12.copyWith(
                    color: Color(0xFF145DB8),
                  ),
                ),
              ),
            ],
          ),
        ),

        ListView.builder(
          itemCount: doctors.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBBC1C7)),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Row(
                children: [
                  Image.network(
                    doctor["imageUrl"],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor["name"], style: AppStyle.georgiaNormal18),
                        const SizedBox(height: 4),
                        Text(
                          "${doctor["specialty"]} | ${doctor["hospital"]}",
                          style: AppStyle.georgiaNormal12,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.assetsImagesIconsStar,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${doctor["rating"]}",
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              Assets.assetsImagesIconsClockCircle,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              doctor["time"],
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FavoriteIcon(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
