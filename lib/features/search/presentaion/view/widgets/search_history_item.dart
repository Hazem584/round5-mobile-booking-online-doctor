import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/theming/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/theming/styles.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
    required this.history,
  });

  final String history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0, bottom: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                width: 1,
                color: ColorsManger.borderColor
            )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(history,style: TextStyles.regular14),
          ],
        ),
      ),
    );
  }
}
