
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class SpecialtyItem extends StatelessWidget {
  const SpecialtyItem({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item['icon'], size: 24, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(item['label'], style: AppStyle.georgiaNormal16),
        ],
      ),
    );
  }
}
