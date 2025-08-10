
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/specialty_item.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for specialties
    final List<Map<String, dynamic>> specialties = [
      {'icon': Icons.favorite_border, 'label': 'Heart'},
      {'icon': Icons.visibility_outlined, 'label': 'Eye'},
      {'icon': Icons.local_hospital_outlined, 'label': 'General'},
      {'icon': Icons.face_outlined, 'label': 'Dermatology'},
      {'icon': Icons.child_friendly_outlined, 'label': 'Pediatrics'},
      {'icon': Icons.psychology_outlined, 'label': 'Psychology'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Specialties', style: AppStyle.georgia22),
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
        const SizedBox(height: 12),
        SizedBox(
          height: 50,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: specialties.length,

            itemBuilder: (context, index) {
              final item = specialties[index];
              return SpecialtyItem(item: item);
            },
          ),
        ),
      ],
    );
  }
}
