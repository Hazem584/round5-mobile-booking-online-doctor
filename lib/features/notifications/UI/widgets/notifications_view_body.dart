import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/widgets/build_notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          verticalSpace(12),
          BuildNotificationItem(
            imagePath: Assets.assetsImagesTimeQuarter,
            iconColor: Colors.transparent,
            iconBgColor: Color(0xffE8EFF8),
            title: 'Upcoming Appointment',
            subtitle: 'Reminder: You have an appointment with...',
            time: '1h',
          ),
          verticalSpace(12),
          BuildNotificationItem(
            imagePath: Assets.assetsImagesCompleted,
            iconColor: Colors.transparent,
            iconBgColor: Color(0xffEDF7EE),
            title: 'Appointment completed',
            subtitle:
                'You have successfully booked your appointment with Dr. Emily Walker.',
            time: '3h',
          ),
          verticalSpace(12),
          BuildNotificationItem(
            imagePath: Assets.assetsImagesCalendarRemove,
            iconColor: Colors.transparent,
            iconBgColor: Color(0xffFFEDED),
            title: 'Appointment Cancelled',
            subtitle:
                'You have successfully cancelled your appointment with Dr. David Patel.',
            time: '4h',
          ),
        ],
      ),
    );
  }
}
