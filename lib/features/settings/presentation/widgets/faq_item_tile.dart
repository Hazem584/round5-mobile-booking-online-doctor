import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class FaqItemTile extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqItemTile({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.remove : Icons.add,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              answer,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
