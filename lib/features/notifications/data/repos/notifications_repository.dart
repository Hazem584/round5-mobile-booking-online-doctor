// optimized_mock_notifications_repository.dart - Updated to ensure correct read status
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_booking_with_doctor/features/notifications/data/model/notification_model.dart';

class MockNotificationsRepository {
  final Dio _dio;
  static const String baseUrl =
      'https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api';
  static bool _apiAvailable = false;
  static DateTime? _lastApiCheck;
  static const Duration _apiCheckInterval = Duration(minutes: 10);
  static bool _isApiChecking = false;

  MockNotificationsRepository({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.connectTimeout = const Duration(seconds: 2);
    _dio.options.receiveTimeout = const Duration(seconds: 2);
    _dio.options.sendTimeout = const Duration(seconds: 2);
  }

  // Updated mock data to ensure 2 notifications are unread as shown in image
  final List<NotificationModel> _mockNotifications = [
    NotificationModel(
      id: 1,
      title: 'Upcoming Appointment',
      message: 'Reminder: You have an appointment with...',
      type: 'Upcoming Appointment',
      isRead: false, // unread - should have gray background
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NotificationModel(
      id: 2,
      title: 'Appointment completed',
      message:
          'You have successfully booked your appointment with Dr. Emily Walker.',
      type: 'Appointment completed',
      isRead: false, // unread - should have gray background
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    NotificationModel(
      id: 3,
      title: 'Appointment Cancelled',
      message:
          'You have successfully cancelled your appointment with Dr. David Patel.',
      type: 'Appointment Cancelled',
      isRead: true, // read - should have white background
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
  ];

  // Check if we should attempt API call
  bool _shouldTryApi() {
    if (_isApiChecking) return false;
    if (_apiAvailable) return true;
    if (_lastApiCheck == null) return true;
    return DateTime.now().difference(_lastApiCheck!) > _apiCheckInterval;
  }

  // Quick API availability check without blocking
  Future<void> _quickApiCheck() async {
    if (_isApiChecking || _apiAvailable) return;

    _isApiChecking = true;
    _lastApiCheck = DateTime.now();

    try {
      if (kDebugMode) {
        print('📱 Quick API check...');
      }

      final response = await _dio.get(
        '$baseUrl/health',
        options: Options(
          headers: {'Accept': 'application/json'},
          sendTimeout: const Duration(milliseconds: 1500),
          receiveTimeout: const Duration(milliseconds: 1500),
        ),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('✅ API is available!');
        }
        _apiAvailable = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('🌐 API not available: ${e.toString().substring(0, 50)}...');
      }
      _apiAvailable = false;
    } finally {
      _isApiChecking = false;
    }
  }

  // Get all notifications
  Future<List<NotificationModel>> getNotifications() async {
    if (kDebugMode) {
      print('📋 Getting notifications...');
      print('📊 Current notifications:');
      for (var notification in _mockNotifications) {
        print('  - ${notification.title} (Read: ${notification.isRead})');
      }
    }

    // Start with mock data immediately
    final mockData = List<NotificationModel>.from(_mockNotifications);

    // Try API in background if appropriate
    if (_shouldTryApi()) {
      _quickApiCheck();
    }

    // Add minimal realistic delay
    await Future.delayed(const Duration(milliseconds: 200));

    if (kDebugMode) {
      print('✅ Returning ${mockData.length} notifications');
    }
    return mockData;
  }

  // Mark notification as read
  Future<bool> markAsRead(int notificationId) async {
    if (kDebugMode) {
      print('🔄 Marking notification $notificationId as read...');
    }

    // Update mock data immediately
    final index = _mockNotifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _mockNotifications[index];
      if (!notification.isRead) {
        _mockNotifications[index] = NotificationModel(
          id: notification.id,
          title: notification.title,
          message: notification.message,
          type: notification.type,
          isRead: true, // Mark as read
          createdAt: notification.createdAt,
          imageUrl: notification.imageUrl,
        );
        if (kDebugMode) {
          print('✅ Mock notification marked as read');
        }
      }
    }

    if (_apiAvailable) {
      _updateApiInBackground('mark-read', notificationId);
    }
    return true;
  }

  // Delete notification
  Future<bool> deleteNotification(int notificationId) async {
    if (kDebugMode) {
      print('🔄 Deleting notification $notificationId...');
    }

    final originalLength = _mockNotifications.length;
    _mockNotifications.removeWhere((n) => n.id == notificationId);

    final success = _mockNotifications.length < originalLength;
    if (success && kDebugMode) {
      print('✅ Mock notification deleted');
    }

    if (_apiAvailable) {
      _deleteApiInBackground(notificationId);
    }
    return success;
  }

  // Get unread count
  Future<int> getUnreadCount() async {
    final count = _mockNotifications.where((n) => !n.isRead).length;
    if (kDebugMode) {
      print('📊 Unread count: $count');
    }
    return count;
  }

  // Mark all as read
  Future<bool> markAllAsRead() async {
    if (kDebugMode) {
      print('🔄 Marking all notifications as read...');
    }

    for (int i = 0; i < _mockNotifications.length; i++) {
      final notification = _mockNotifications[i];
      _mockNotifications[i] = NotificationModel(
        id: notification.id,
        title: notification.title,
        message: notification.message,
        type: notification.type,
        isRead: true, // Mark all as read
        createdAt: notification.createdAt,
        imageUrl: notification.imageUrl,
      );
    }

    if (kDebugMode) {
      print('✅ All mock notifications marked as read');
    }

    if (_apiAvailable) {
      _markAllReadApiInBackground();
    }

    return true;
  }

  // Background API operations (non-blocking)
  void _updateApiInBackground(String action, int notificationId) {
    Future.microtask(() async {
      try {
        await _dio.patch(
          '$baseUrl/notifications/$notificationId/$action',
          options: Options(
            headers: {'Accept': 'application/json'},
            sendTimeout: const Duration(seconds: 2),
            receiveTimeout: const Duration(seconds: 2),
          ),
        );
        if (kDebugMode) {
          print('✅ Background API update successful');
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ Background API update failed (non-critical): $e');
        }
        if (e is DioException && e.response?.statusCode == 404) {
          _apiAvailable = false;
        }
      }
    });
  }

  void _deleteApiInBackground(int notificationId) {
    Future.microtask(() async {
      try {
        await _dio.delete(
          '$baseUrl/notifications/$notificationId',
          options: Options(
            headers: {'Accept': 'application/json'},
            sendTimeout: const Duration(seconds: 2),
            receiveTimeout: const Duration(seconds: 2),
          ),
        );
        if (kDebugMode) {
          print('✅ Background API delete successful');
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ Background API delete failed (non-critical): $e');
        }
        if (e is DioException && e.response?.statusCode == 404) {
          _apiAvailable = false;
        }
      }
    });
  }

  void _markAllReadApiInBackground() {
    Future.microtask(() async {
      try {
        await _dio.patch(
          '$baseUrl/notifications/mark-all-read',
          options: Options(
            headers: {'Accept': 'application/json'},
            sendTimeout: const Duration(seconds: 2),
            receiveTimeout: const Duration(seconds: 2),
          ),
        );
        if (kDebugMode) {
          print('✅ Background API mark all read successful');
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ Background API mark all read failed (non-critical): $e');
        }
        if (e is DioException && e.response?.statusCode == 404) {
          _apiAvailable = false;
        }
      }
    });
  }

  // Utility methods
  void addMockNotification(NotificationModel notification) {
    _mockNotifications.insert(0, notification);
    if (kDebugMode) {
      print('✅ Mock notification added: ${notification.title}');
    }
  }

  void clearAllNotifications() {
    _mockNotifications.clear();
    if (kDebugMode) {
      print('✅ All mock notifications cleared');
    }
  }

  void resetApiAvailability() {
    _apiAvailable = false;
    _lastApiCheck = null;
    _isApiChecking = false;
    if (kDebugMode) {
      print('🔄 API availability reset');
    }
  }

  bool get apiAvailable => _apiAvailable;
  List<NotificationModel> getMockData() => List.from(_mockNotifications);
}
