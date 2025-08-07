import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/extensions.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/widgets/empty_notifications_view.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/widgets/notifications_view_body.dart';

class NotificationsView extends StatefulWidget {
  static const String routeName = '/notifications';

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool hasNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            // TODO: implement back navigation
            context.pushNamed(Routes.profile);
          },
        ),
        title: Text('Notifications', style: TextStyles.font24LightBlackNormal),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              hasNotifications ? Icons.notifications_off : Icons.notifications,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                hasNotifications = !hasNotifications;
              });
            },
          ),
        ],
      ),
      body: hasNotifications ? NotificationsList() : EmptyNotificationsView(),
    );
  }
}
