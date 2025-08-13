// notifications_repository.dart - Enhanced with API Integration
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/notification_model.dart';

class MockNotificationsRepository {
  final Dio _dio;
  static const String baseUrl =
      'http://round5-online-booking-with-doctor-api.huma-volve.com/api/';
  static bool _apiAvailable = false;
  static DateTime? _lastApiCheck;
  static const Duration _apiCheckInterval = Duration(minutes: 5);
  static bool _isApiChecking = false;

  // Cache for offline support
  List<NotificationModel> _cachedNotifications = [];
  bool _hasCachedData = false;

  MockNotificationsRepository({Dio? dio}) : _dio = dio ?? Dio() {
    _setupDioInterceptors();
  }

  void _setupDioInterceptors() {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.sendTimeout = const Duration(seconds: 10);
    _dio.options.baseUrl = baseUrl;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';
          options.headers['Content-Type'] = 'application/json';
          
          if (kDebugMode) {
            print('🌐 API Request: ${options.method} ${options.path}');
            print('🔑 Token: ${token != null ? "Present" : "Missing"}');
          }
          
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('✅ API Response: ${response.statusCode} ${response.requestOptions.path}');
          }
          handler.next(response);
        },
        onError: (error, handler) {
          if (kDebugMode) {
            print('❌ API Error: ${error.response?.statusCode} ${error.requestOptions.path}');
            print('❌ Error message: ${error.message}');
          }
          
          if (error.response?.statusCode == 401) {
            _handleUnauthorized();
          }
          
          handler.next(error);
        },
      ),
    );
  }

  Future<String?> _getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token') ?? prefs.getString('user_token');
      
      if (kDebugMode) {
        print('🔑 Retrieved token: ${token != null ? "Found" : "Not found"}');
      }
      
      return token;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting auth token: $e');
      }
      return null;
    }
  }

  void _handleUnauthorized() {
    if (kDebugMode) {
      print('🚫 Unauthorized access - token may be expired');
    }
    _apiAvailable = false;
  }

  Future<bool> _checkApiAvailability() async {
    if (_isApiChecking) return _apiAvailable;
    
    _isApiChecking = true;
    _lastApiCheck = DateTime.now();

    try {
      if (kDebugMode) {
        print('🔍 Checking API availability...');
      }

      final response = await _dio.get(
        'notifications',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      _apiAvailable = response.statusCode == 200;
      
      if (kDebugMode) {
        print('✅ API availability: $_apiAvailable');
      }
      
      return _apiAvailable;
    } catch (e) {
      if (kDebugMode) {
        print('🌐 API not available: $e');
      }
      _apiAvailable = false;
      return false;
    } finally {
      _isApiChecking = false;
    }
  }

  bool _shouldTryApi() {
    if (_isApiChecking) return false;
    if (_apiAvailable) return true;
    if (_lastApiCheck == null) return true;
    return DateTime.now().difference(_lastApiCheck!) > _apiCheckInterval;
  }

  // Get notifications from API
  Future<List<NotificationModel>> _getNotificationsFromApi() async {
    try {
      if (kDebugMode) {
        print('📡 Fetching notifications from API...');
      }

      final response = await _dio.get('notifications');
      
      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['success'] == true && data['data'] != null) {
          final notificationsJson = data['data']['data'] as List<dynamic>? ?? [];
          
          final notifications = notificationsJson.map((json) {
            return NotificationModel.fromJson(json as Map<String, dynamic>);
          }).toList();
          
          _cachedNotifications = notifications;
          _hasCachedData = true;
          
          if (kDebugMode) {
            print('✅ Fetched ${notifications.length} notifications from API');
          }
          
          return notifications;
        }
      }
      
      throw Exception('Invalid API response format');
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error fetching from API: $e');
      }
      rethrow;
    }
  }

  List<NotificationModel> _getMockNotifications() {
    return [
      NotificationModel(
        id: 1,
        title: 'Upcoming Appointment',
        message: 'Reminder: You have an appointment with...',
        type: 'Upcoming Appointment',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: 2,
        title: 'Appointment completed',
        message: 'You have successfully booked your appointment with Dr. Emily Walker.',
        type: 'Appointment completed',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      NotificationModel(
        id: 3,
        title: 'Appointment Cancelled',
        message: 'You have successfully cancelled your appointment with Dr. David Patel.',
        type: 'Appointment Cancelled',
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
    ];
  }

  Future<List<NotificationModel>> getNotifications() async {
    if (kDebugMode) {
      print('📋 Getting notifications...');
    }

    if (_shouldTryApi()) {
      try {
        final token = await _getAuthToken();
        
        if (token != null) {
          // Try to get from API
          await _checkApiAvailability();
          
          if (_apiAvailable) {
            final apiNotifications = await _getNotificationsFromApi();
            return apiNotifications;
          }
        } else {
          if (kDebugMode) {
            print('🚫 No auth token available, using mock data');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('❌ API call failed, falling back to cache/mock: $e');
        }
      }
    }

    if (_hasCachedData && _cachedNotifications.isNotEmpty) {
      if (kDebugMode) {
        print('📦 Returning cached notifications: ${_cachedNotifications.length}');
      }
      return List.from(_cachedNotifications);
    }

    if (kDebugMode) {
      print('🎭 Returning mock notifications');
    }
    final mockData = _getMockNotifications();
    _cachedNotifications = mockData;
    _hasCachedData = true;
    return mockData;
  }

  Future<bool> markAsRead(int notificationId) async {
    if (kDebugMode) {
      print('🔄 Marking notification $notificationId as read...');
    }

    _updateCacheNotificationReadStatus(notificationId, true);

    final token = await _getAuthToken();
    if (token != null && _apiAvailable) {
      try {
        final response = await _dio.patch(
          'notifications/$notificationId/mark-as-read',
          options: Options(
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('✅ Successfully marked as read via API');
          }
          return true;
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ API mark as read failed: $e');
        }
      }
    }

    return true;
  }

  Future<bool> deleteNotification(int notificationId) async {
    if (kDebugMode) {
      print('🔄 Deleting notification $notificationId...');
    }

    _removeCacheNotification(notificationId);

    final token = await _getAuthToken();
    if (token != null && _apiAvailable) {
      try {
        final response = await _dio.delete(
          'notifications/$notificationId',
          options: Options(
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('✅ Successfully deleted via API');
          }
          return true;
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ API delete failed: $e');
        }
      }
    }

    return true; 
  }

  Future<bool> markAllAsRead() async {
    if (kDebugMode) {
      print('🔄 Marking all notifications as read...');
    }

    _updateAllCacheNotificationsReadStatus(true);

    final token = await _getAuthToken();
    if (token != null && _apiAvailable) {
      try {
        final response = await _dio.patch(
          'notifications/mark-all-as-read',
          options: Options(
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('✅ Successfully marked all as read via API');
          }
          return true;
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ API mark all as read failed: $e');
        }
      }
    }

    return true;
  }

  Future<int> getUnreadCount() async {
    if (_hasCachedData) {
      final count = _cachedNotifications.where((n) => !n.isRead).length;
      if (kDebugMode) {
        print('📊 Unread count from cache: $count');
      }
      return count;
    }

    final notifications = await getNotifications();
    return notifications.where((n) => !n.isRead).length;
  }

  void _updateCacheNotificationReadStatus(int notificationId, bool isRead) {
    if (_hasCachedData) {
      final index = _cachedNotifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        final notification = _cachedNotifications[index];
        _cachedNotifications[index] = notification.copyWith(isRead: isRead);
        
        if (kDebugMode) {
          print('✅ Updated cache notification $notificationId read status: $isRead');
        }
      }
    }
  }

  void _removeCacheNotification(int notificationId) {
    if (_hasCachedData) {
      _cachedNotifications.removeWhere((n) => n.id == notificationId);
      
      if (kDebugMode) {
        print('✅ Removed notification $notificationId from cache');
      }
    }
  }

  void _updateAllCacheNotificationsReadStatus(bool isRead) {
    if (_hasCachedData) {
      _cachedNotifications = _cachedNotifications.map((notification) {
        return notification.copyWith(isRead: isRead);
      }).toList();
      
      if (kDebugMode) {
        print('✅ Updated all cache notifications read status: $isRead');
      }
    }
  }

  // Utility methods
  void addMockNotification(NotificationModel notification) {
    _cachedNotifications.insert(0, notification);
    _hasCachedData = true;
    
    if (kDebugMode) {
      print('✅ Added notification to cache: ${notification.title}');
    }
  }

  void clearAllNotifications() {
    _cachedNotifications.clear();
    _hasCachedData = true;
    
    if (kDebugMode) {
      print('✅ Cleared all cached notifications');
    }
  }

  void clearCache() {
    _cachedNotifications.clear();
    _hasCachedData = false;
    _apiAvailable = false;
    _lastApiCheck = null;
    
    if (kDebugMode) {
      print('🔄 Cache and API status cleared');
    }
  }

  Future<List<NotificationModel>> forceRefreshFromApi() async {
    _lastApiCheck = null;
    _apiAvailable = false;
    
    final token = await _getAuthToken();
    if (token == null) {
      throw Exception('No authentication token available');
    }

    await _checkApiAvailability();
    if (!_apiAvailable) {
      throw Exception('API is not available');
    }

    return await _getNotificationsFromApi();
  }

  bool get apiAvailable => _apiAvailable;
  bool get hasCachedData => _hasCachedData;
  List<NotificationModel> get cachedNotifications => List.from(_cachedNotifications);
  
  void resetApiAvailability() {
    _apiAvailable = false;
    _lastApiCheck = null;
    _isApiChecking = false;
    
    if (kDebugMode) {
      print('🔄 API availability reset');
    }
  }
}