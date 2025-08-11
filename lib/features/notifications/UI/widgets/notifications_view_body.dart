import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/notification_model.dart';
import 'notification_item_widget.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('📋 Building NotificationsList with ${notifications.length} items');
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        if (kDebugMode) {
          print('🔨 Building item $index: ${notification.title}');
        }

        return NotificationItemWidget(notification: notification);
      },
    );
  }
}
