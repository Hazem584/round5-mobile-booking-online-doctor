import '../../../../core/theming/app_colors.dart';
import '../../data/model/notification_model.dart';
import '../../logic/cubit/notifications_cubit.dart';
import 'build_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        '🔔 Building notification: ${notification.title} (${notification.type})',
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Colors.transparent
            : ColorsManger.lightBlue,
      ),
      child: Stack(
        children: [
          BuildNotificationItem(
            imagePath: notification.iconPath,
            iconBgColor: notification.iconBgColor,
            title: notification.title,
            subtitle: notification.message,
            time: notification.formattedTime,
          ),
          _buildTouchArea(context),
        ],
      ),
    );
  }

  Widget _buildTouchArea(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () => _handleNotificationTap(context),
          child: Container(),
        ),
      ),
    );
  }

  void _handleNotificationTap(BuildContext context) {
    try {
      if (kDebugMode) {
        print('🔔 Notification tapped: ${notification.title}');
      }

      if (!notification.isRead) {
        context.read<NotificationsCubit>().markAsRead(notification.id);
        Future.delayed(const Duration(milliseconds: 100), () {});
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error in _handleNotificationTap: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error processing notification'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
