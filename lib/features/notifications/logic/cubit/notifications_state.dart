
import '../../data/model/notification_model.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationModel> notifications;
  final int unreadCount;

  NotificationsLoaded({
    required this.notifications,
    this.unreadCount = 0,
  });
}

class NotificationsError extends NotificationsState {
  final String message;

  NotificationsError(this.message);
}

class NotificationActionLoading extends NotificationsState {}

class NotificationActionSuccess extends NotificationsState {
  final String message;

  NotificationActionSuccess(this.message);
}