// Fixed notifications_cubit.dart (Performance Optimized)
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/features/notifications/data/model/notification_model.dart';
import 'package:online_booking_with_doctor/features/notifications/data/repos/notifications_repository.dart';
import 'package:online_booking_with_doctor/features/notifications/logic/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final MockNotificationsRepository _repository;
  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;
  bool _isLoading = false;

  NotificationsCubit(this._repository) : super(NotificationsInitial());

  List<NotificationModel> get notifications => List.from(_notifications);
  int get unreadCount => _unreadCount;
  bool get hasNotifications => _notifications.isNotEmpty;
  bool get isLoading => _isLoading;

  // Load notifications - Optimized for performance
  Future<void> loadNotifications() async {
    if (_isLoading) {
      if (kDebugMode) {
        print('⏭️ Already loading, skipping...');
      }
      return;
    }

    _isLoading = true;
    emit(NotificationsLoading());

    try {
      if (kDebugMode) {
        print('🔄 Loading notifications...');
      }

      // Use timeout to prevent hanging
      final notifications = await _repository.getNotifications().timeout(
        const Duration(seconds: 5),
      );

      final unreadCount = await _repository.getUnreadCount().timeout(
        const Duration(seconds: 2),
      );

      _notifications = notifications;
      _unreadCount = unreadCount;

      if (kDebugMode) {
        print(
          '✅ Loaded ${notifications.length} notifications, $unreadCount unread',
        );
      }

      if (!isClosed) {
        emit(
          NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error loading notifications: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Error loading notifications'));
      }
    } finally {
      _isLoading = false;
    }
  }

  // Refresh notifications - Non-blocking
  Future<void> refreshNotifications() async {
    try {
      if (kDebugMode) {
        print('🔄 Refreshing notifications...');
      }

      // Don't show loading state for refresh
      final notifications = await _repository.getNotifications().timeout(
        const Duration(seconds: 3),
      );

      final unreadCount = await _repository.getUnreadCount().timeout(
        const Duration(seconds: 1),
      );

      _notifications = notifications;
      _unreadCount = unreadCount;

      if (kDebugMode) {
        print(
          '✅ Refreshed ${notifications.length} notifications, $unreadCount unread',
        );
      }

      if (!isClosed) {
        emit(
          NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error refreshing notifications: $e');
      }
      // Don't emit error for refresh, just log it
    }
  }

  // Mark notification as read - Optimistic update
  Future<void> markAsRead(int notificationId) async {
    try {
      if (kDebugMode) {
        print('🔄 Marking notification $notificationId as read...');
      }

      // Find the notification
      final notificationIndex = _notifications.indexWhere(
        (n) => n.id == notificationId,
      );

      if (notificationIndex == -1) {
        if (kDebugMode) {
          print('❌ Notification not found');
        }
        return;
      }

      final notification = _notifications[notificationIndex];

      // Only update if it wasn't already read
      if (!notification.isRead) {
        // Update local state immediately (optimistic update)
        _notifications[notificationIndex] = NotificationModel(
          id: notification.id,
          title: notification.title,
          message: notification.message,
          type: notification.type,
          isRead: true,
          createdAt: notification.createdAt,
          imageUrl: notification.imageUrl,
        );

        // Decrease unread count
        if (_unreadCount > 0) {
          _unreadCount--;
        }

        if (kDebugMode) {
          print(
            '✅ Optimistic update: notification marked as read, unread count: $_unreadCount',
          );
        }

        // Emit updated state immediately
        if (!isClosed) {
          emit(
            NotificationsLoaded(
              notifications: List.from(_notifications),
              unreadCount: _unreadCount,
            ),
          );
        }

        // Update repository in background (non-blocking)
        // ignore: body_might_complete_normally_catch_error
        _repository.markAsRead(notificationId).catchError((e) {
          if (kDebugMode) {
            print('⚠️ Background mark as read failed: $e');
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error marking notification as read: $e');
      }
      // Don't emit error, just log it
    }
  }

  // Delete notification - Optimistic update
  Future<void> deleteNotification(int notificationId) async {
    try {
      if (kDebugMode) {
        print('🔄 Deleting notification $notificationId...');
      }

      // Find the notification before deleting
      final notificationToDelete = _notifications.firstWhere(
        (n) => n.id == notificationId,
        orElse: () => throw Exception('Notification not found'),
      );

      // Remove from local state immediately (optimistic update)
      _notifications.removeWhere((n) => n.id == notificationId);

      // Update unread count if deleted notification was unread
      if (!notificationToDelete.isRead && _unreadCount > 0) {
        _unreadCount--;
      }

      if (kDebugMode) {
        print(
          '✅ Optimistic delete: remaining ${_notifications.length}, unread: $_unreadCount',
        );
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(
          NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ),
        );
      }

      // Update repository in background
      _repository
          .deleteNotification(notificationId)
          .then((success) {
            if (success) {
              if (kDebugMode) {
                print('✅ Background delete successful');
              }
              if (!isClosed) {
                emit(
                  NotificationActionSuccess(
                    'Notification deleted successfully',
                  ),
                );
              }
            }
          })
          .catchError((e) {
            if (kDebugMode) {
              print('⚠️ Background delete failed: $e');
            }
          });
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error deleting notification: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Failed to delete notification'));
      }
    }
  }

  // Mark all as read - Optimistic update
  Future<void> markAllAsRead() async {
    final unreadNotifications = _notifications.where((n) => !n.isRead).toList();

    if (unreadNotifications.isEmpty) {
      if (!isClosed) {
        emit(NotificationActionSuccess('All notifications are already read'));
      }
      return;
    }

    try {
      if (kDebugMode) {
        print('🔄 Marking all notifications as read...');
      }

      // Update all notifications to read immediately (optimistic update)
      _notifications = _notifications.map((notification) {
        return NotificationModel(
          id: notification.id,
          title: notification.title,
          message: notification.message,
          type: notification.type,
          isRead: true,
          createdAt: notification.createdAt,
          imageUrl: notification.imageUrl,
        );
      }).toList();

      _unreadCount = 0;

      if (kDebugMode) {
        print('✅ Optimistic mark all read: unread count now 0');
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(
          NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ),
        );
      }

      // Update repository in background
      _repository
          .markAllAsRead()
          .then((success) {
            if (success) {
              if (kDebugMode) {
                print('✅ Background mark all read successful');
              }
              if (!isClosed) {
                emit(
                  NotificationActionSuccess('All notifications marked as read'),
                );
              }
            }
          })
          .catchError((e) {
            if (kDebugMode) {
              print('⚠️ Background mark all read failed: $e');
            }
          });
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error marking all as read: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Failed to mark all as read'));
      }
    }
  }

  // Clear all notifications - Instant update
  Future<void> clearAllNotifications() async {
    try {
      if (kDebugMode) {
        print('🔄 Clearing all notifications...');
      }

      // Clear local state immediately
      _notifications.clear();
      _unreadCount = 0;

      if (kDebugMode) {
        print('✅ All notifications cleared');
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(NotificationsLoaded(notifications: [], unreadCount: 0));
        emit(NotificationActionSuccess('All notifications cleared'));
      }

      // Update repository in background
      Future.microtask(() {
        _repository.clearAllNotifications();
      });
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error clearing notifications: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Failed to clear notifications'));
      }
    }
  }

  // Add a test notification - Instant update
  void addTestNotification() {
    try {
      final newNotification = NotificationModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: 'Test Notification',
        message: DateTime.now().toString().substring(11, 16),
        type: 'Upcoming Appointment',
        isRead: false,
        createdAt: DateTime.now(),
      );

      // Add to local state immediately
      _notifications.insert(0, newNotification);
      _unreadCount++;

      if (kDebugMode) {
        print('✅ Test notification added, unread count: $_unreadCount');
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(
          NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ),
        );
        emit(NotificationActionSuccess('Test notification added'));
      }

      // Update repository in background
      Future.microtask(() {
        _repository.addMockNotification(newNotification);
      });
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error adding test notification: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Failed to add test notification'));
      }
    }
  }

  // Reset to initial state
  void reset() {
    try {
      _notifications.clear();
      _unreadCount = 0;
      _isLoading = false;
      if (!isClosed) {
        emit(NotificationsInitial());
      }
      if (kDebugMode) {
        print('🔄 Cubit reset to initial state');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error resetting cubit: $e');
      }
    }
  }

  @override
  Future<void> close() {
    if (kDebugMode) {
      print('🔒 NotificationsCubit closing...');
    }
    return super.close();
  }
}
