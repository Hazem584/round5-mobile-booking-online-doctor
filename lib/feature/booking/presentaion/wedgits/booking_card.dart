import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import 'elevate_button.dart';
import 'outline_button.dart';

class BookingCard extends StatelessWidget {
  final String status;
  const BookingCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Widget? actionRow;

    switch (status) {
      case 'Upcoming':
        statusColor = Colors.blue;
        actionRow = Row(
          children: [
            Expanded(child: OutlineButton(txt: "Cancel")),
            const SizedBox(width: 16),
            Expanded(child: ElevatButton(txt: "Reschedule")),
          ],
        );
        break;
      case 'Completed':
        statusColor = Colors.green;
        actionRow = Row(
          children: [
            Expanded(child: OutlineButton(txt: "Book again")),
            const SizedBox(width: 16),
            Expanded(child: ElevatButton(txt: "Feedback")),
          ],
        );
        break;
      case 'Canceled':
        statusColor = Colors.red;
        actionRow = Row(
          children: [
            Expanded(child: OutlineButton(txt: "Book again")),
            const SizedBox(width: 16),
            Expanded(child: ElevatButton(txt: "Support")),
          ],
        );
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/icons/calendar-02.png", height: 20, width: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "Monday, July 21 • 11:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.black14w500,
                  ),
                ),
                Text(status, style: AppTextStyles.black14w500.copyWith(color: statusColor)),
              ],
            ),
            const Divider(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/1.png")),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jennifer Miller", style: AppTextStyles.black14w500),
                      Text("Psychiatrist", style: AppTextStyles.grey12w400),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "129, El-Nasr Street, Cairo, Egypt",
                              style: AppTextStyles.grey12w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (actionRow != null) actionRow!,
          ],
        ),
      ),
    );
  }
}
