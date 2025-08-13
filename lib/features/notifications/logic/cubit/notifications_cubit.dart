// Updated notifications_cubit.dart with API Integration
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';

import '../../data/model/notification_model.dart';
import '../../data/repos/notifications_repository.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final MockNotificationsRepository _repository;
  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;
  bool _isLoading = false;
  bool _isInitialized = false;

  NotificationsCubit(this._repository) : super(NotificationsInitial());

  List<NotificationModel> get notifications => List.from(_notifications);
  int get unreadCount => _unreadCount;
  bool get hasNotifications => _notifications.isNotEmpty;
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  // Initialize the cubit - check auth and load notifications
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      if (kDebugMode) {
        print('🔄 Initializing NotificationsCubit...');
      }

      // Initialize AuthManager
      await AuthManager.initialize();

      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      
      if (kDebugMode) {
        print('👤 User logged in: $isLoggedIn');
      }

      if (isLoggedIn) {
        // Load notifications if user is logged in
        await loadNotifications();
      } else {
        if (kDebugMode) {
          print('🚫 User not logged in, showing empty state');
        }
        emit(NotificationsLoaded(notifications: [], unreadCount: 0));
      }

      _isInitialized = true;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error initializing NotificationsCubit: $e');
      }
      emit(NotificationsError('Failed to initialize notifications'));
    }
  }

  // Load notifications - Enhanced with auth check
  Future<void> loadNotifications({bool forceRefresh = false}) async {
    if (_isLoading && !forceRefresh) {
      if (kDebugMode) {
        print('⏭️ Already loading, skipping...');
      }
      return;
    }

    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot load notifications');
        }
        emit(NotificationsLoaded(notifications: [], unreadCount: 0));
        return;
      }

      _isLoading = true;
      
      // Only show loading state if we don't have cached data
      if (_notifications.isEmpty || forceRefresh) {
        emit(NotificationsLoading());
      }

      if (kDebugMode) {
        print('🔄 Loading notifications...');
        final authInfo = await AuthManager.getAuthInfo();
        print('🔑 Auth Info: $authInfo');
      }

      List<NotificationModel> notifications;
      
      if (forceRefresh) {
        // Force refresh from API
        try {
          notifications = await _repository.forceRefreshFromApi().timeout(
            const Duration(seconds: 10),
          );
          if (kDebugMode) {
            print('✅ Force refreshed from API');
          }
        } catch (e) {
          if (kDebugMode) {
            print('⚠️ Force refresh failed, falling back to normal load: $e');
          }
          notifications = await _repository.getNotifications().timeout(
            const Duration(seconds: 8),
          );
        }
      } else {
        // Normal load (with cache support)
        notifications = await _repository.getNotifications().timeout(
          const Duration(seconds: 8),
        );
      }

      final unreadCount = await _repository.getUnreadCount().timeout(
        const Duration(seconds: 3),
      );

      _notifications = notifications;
      _unreadCount = unreadCount;

      if (kDebugMode) {
        print('✅ Loaded ${notifications.length} notifications, $unreadCount unread');
        print('📊 API Available: ${_repository.apiAvailable}');
        print('📦 Has Cached Data: ${_repository.hasCachedData}');
      }

      if (!isClosed) {
        emit(NotificationsLoaded(
          notifications: List.from(_notifications),
          unreadCount: _unreadCount,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error loading notifications: $e');
      }
      
      // If we have cached data, show it instead of error
      if (_notifications.isNotEmpty) {
        if (kDebugMode) {
          print('📦 Showing cached data due to error');
        }
        if (!isClosed) {
          emit(NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ));
        }
      } else {
        if (!isClosed) {
          emit(NotificationsError('Error loading notifications: ${e.toString()}'));
        }
      }
    } finally {
      _isLoading = false;
    }
  }

  // Refresh notifications - Non-blocking with auth check
  Future<void> refreshNotifications() async {
    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot refresh notifications');
        }
        return;
      }

      if (kDebugMode) {
        print('🔄 Refreshing notifications...');
      }

      // Don't show loading state for refresh, but try to get fresh data
      final notifications = await _repository.getNotifications().timeout(
        const Duration(seconds: 5),
      );

      final unreadCount = await _repository.getUnreadCount().timeout(
        const Duration(seconds: 2),
      );

      _notifications = notifications;
      _unreadCount = unreadCount;

      if (kDebugMode) {
        print('✅ Refreshed ${notifications.length} notifications, $unreadCount unread');
      }

      if (!isClosed) {
        emit(NotificationsLoaded(
          notifications: List.from(_notifications),
          unreadCount: _unreadCount,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error refreshing notifications: $e');
      }
      // Don't emit error for refresh, just log it
      // Keep showing existing data
    }
  }

  // Mark notification as read - Enhanced with auth check
  Future<void> markAsRead(int notificationId) async {
    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot mark as read');
        }
        return;
      }

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
        _notifications[notificationIndex] = notification.copyWith(isRead: true);

        // Decrease unread count
        if (_unreadCount > 0) {
          _unreadCount--;
        }

        if (kDebugMode) {
          print('✅ Optimistic update: notification marked as read, unread count: $_unreadCount');
        }

        // Emit updated state immediately
        if (!isClosed) {
          emit(NotificationsLoaded(
            notifications: List.from(_notifications),
            unreadCount: _unreadCount,
          ));
        }

        // Update repository in background (API call)
        _repository.markAsRead(notificationId).then((success) {
          if (kDebugMode) {
            print('✅ Background mark as read result: $success');
          }
        }).catchError((e) {
          if (kDebugMode) {
            print('⚠️ Background mark as read failed: $e');
          }
          // Could implement rollback here if needed
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error marking notification as read: $e');
      }
      // Don't emit error, just log it
    }
  }

  // Delete notification - Enhanced with auth check
  Future<void> deleteNotification(int notificationId) async {
    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot delete notification');
        }
        return;
      }

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
        print('✅ Optimistic delete: remaining ${_notifications.length}, unread: $_unreadCount');
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(NotificationsLoaded(
          notifications: List.from(_notifications),
          unreadCount: _unreadCount,
        ));
      }

      // Update repository in background (API call)
      _repository.deleteNotification(notificationId).then((success) {
        if (success) {
          if (kDebugMode) {
            print('✅ Background delete successful');
          }
          if (!isClosed) {
            emit(NotificationActionSuccess('Notification deleted successfully'));
          }
        }
      }).catchError((e) {
        if (kDebugMode) {
          print('⚠️ Background delete failed: $e');
        }
        // Could implement rollback here if needed
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

  // Mark all as read - Enhanced with auth check
  Future<void> markAllAsRead() async {
    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot mark all as read');
        }
        return;
      }

      final unreadNotifications = _notifications.where((n) => !n.isRead).toList();

      if (unreadNotifications.isEmpty) {
        if (!isClosed) {
          emit(NotificationActionSuccess('All notifications are already read'));
        }
        return;
      }

      if (kDebugMode) {
        print('🔄 Marking all notifications as read...');
      }

      // Update all notifications to read immediately (optimistic update)
      _notifications = _notifications.map((notification) {
        return notification.copyWith(isRead: true);
      }).toList();

      _unreadCount = 0;

      if (kDebugMode) {
        print('✅ Optimistic mark all read: unread count now 0');
      }

      // Emit updated state immediately
      if (!isClosed) {
        emit(NotificationsLoaded(
          notifications: List.from(_notifications),
          unreadCount: _unreadCount,
        ));
      }

      // Update repository in background (API call)
      _repository.markAllAsRead().then((success) {
        if (success) {
          if (kDebugMode) {
            print('✅ Background mark all read successful');
          }
          if (!isClosed) {
            emit(NotificationActionSuccess('All notifications marked as read'));
          }
        }
      }).catchError((e) {
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

  // Clear all notifications - Enhanced with auth check
  Future<void> clearAllNotifications() async {
    try {
      // Check if user is logged in
      final isLoggedIn = await AuthManager.isLoggedIn();
      if (!isLoggedIn) {
        if (kDebugMode) {
          print('🚫 User not logged in, cannot clear notifications');
        }
        return;
      }

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

  // Add a test notification - Enhanced
  void addTestNotification() {
    try {
      final newNotification = NotificationModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: 'Test Notification',
        message: 'Test notification created at ${DateTime.now().toString().substring(11, 16)}',
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
        emit(NotificationsLoaded(
          notifications: List.from(_notifications),
          unreadCount: _unreadCount,
        ));
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

  // Handle user logout
  Future<void> handleLogout() async {
    try {
      if (kDebugMode) {
        print('🚪 Handling user logout...');
      }

      // Clear all local data
      _notifications.clear();
      _unreadCount = 0;
      _isInitialized = false;

      // Clear repository cache
      _repository.clearCache();

      // Clear auth data
      await AuthManager.clearAuth();

      if (!isClosed) {
        emit(NotificationsLoaded(notifications: [], unreadCount: 0));
      }

      if (kDebugMode) {
        print('✅ Logout handled, all data cleared');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error handling logout: $e');
      }
    }
  }

  // Handle user login
  Future<void> handleLogin(String token, {int? userId}) async {
    try {
      if (kDebugMode) {
        print('🔑 Handling user login...');
      }

      // Save auth token
      await AuthManager.saveAuthToken(
        token,
        userId: userId,
        expiryDate: DateTime.now().add(const Duration(hours: 24)),
      );

      // Reset repository state
      _repository.clearCache();

      // Reset cubit state
      _notifications.clear();
      _unreadCount = 0;
      _isInitialized = false;

      // Initialize and load notifications
      await initialize();

      if (kDebugMode) {
        print('✅ Login handled, notifications loaded');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error handling login: $e');
      }
      if (!isClosed) {
        emit(NotificationsError('Failed to load notifications after login'));
      }
    }
  }

  // Force refresh from API
  Future<void> forceRefreshFromApi() async {
    await loadNotifications(forceRefresh: true);
  }

  // Reset to initial state
  void reset() {
    try {
      _notifications.clear();
      _unreadCount = 0;
      _isLoading = false;
      _isInitialized = false;
      
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