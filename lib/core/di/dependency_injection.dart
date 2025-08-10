// Fixed dependency_injection.dart
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:online_booking_with_doctor/features/notifications/data/repos/notifications_repository.dart';
import 'package:online_booking_with_doctor/features/notifications/logic/cubit/notifications_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupNotificationsDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up notifications dependencies...');
    }

    // Register Dio instance (if not already registered)
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerLazySingleton<Dio>(() {
        final dio = Dio();
        
        // Configure Dio for performance and reliability
        dio.options.connectTimeout = const Duration(seconds: 3);
        dio.options.receiveTimeout = const Duration(seconds: 3);
        dio.options.sendTimeout = const Duration(seconds: 3);
        
        // Add logging interceptor only in debug mode
        dio.interceptors.add(LogInterceptor(
          requestBody: false, // Disable body logging to reduce overhead
          responseBody: false,
          requestHeader: false,
          responseHeader: false,
          error: true,
          logPrint: (obj) {
            // Only log important information
            if (obj.toString().contains('ERROR') || obj.toString().contains('DioException')) {
              if (kDebugMode) {
                print('🌐 HTTP: $obj');
              }
            }
          },
        ));
        
        // Add error handling interceptor
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add your token here if available
            // final token = getTokenFromSecureStorage();
            // if (token != null) {
            //   options.headers['Authorization'] = 'Bearer $token';
            // }
            handler.next(options);
          },
          onResponse: (response, handler) {
            handler.next(response);
          },
          onError: (error, handler) {
            // Handle different error types
            if (error.response?.statusCode == 401) {
              if (kDebugMode) {
                print('🔐 Unauthorized access - token may be expired');
              }
              // Handle token refresh or logout
            } else if (error.response?.statusCode == 403) {
              if (kDebugMode) {
                print('🚫 Forbidden access');
              }
            } else if (error.response?.statusCode == 404) {
              if (kDebugMode) {
                print('🔍 Endpoint not found - using mock data');
              }
            } else if (error.type == DioExceptionType.connectionTimeout ||
                       error.type == DioExceptionType.receiveTimeout) {
              if (kDebugMode) {
                print('⏰ Request timeout - using mock data');
              }
            } else {
              if (kDebugMode) {
                print('🌐 Network error: ${error.message}');
              }
            }
            handler.next(error);
          },
        ));
        
        if (kDebugMode) {
          print('✅ Dio configured successfully');
        }
        return dio;
      });
    }

    // Register Mock Repository with error handling
    if (!getIt.isRegistered<MockNotificationsRepository>()) {
      getIt.registerLazySingleton<MockNotificationsRepository>(() {
        try {
          final repository = MockNotificationsRepository(dio: getIt<Dio>());
          if (kDebugMode) {
            print('✅ MockNotificationsRepository registered');
          }
          return repository;
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error creating MockNotificationsRepository: $e');
          }
          // Fallback: create repository without DI
          return MockNotificationsRepository();
        }
      });
    }

    // Register Cubit with error handling
    if (!getIt.isRegistered<NotificationsCubit>()) {
      getIt.registerFactory<NotificationsCubit>(() {
        try {
          final cubit = NotificationsCubit(getIt<MockNotificationsRepository>());
          if (kDebugMode) {
            print('✅ NotificationsCubit registered');
          }
          return cubit;
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error creating NotificationsCubit: $e');
          }
          // Fallback: create cubit with new repository
          return NotificationsCubit(MockNotificationsRepository());
        }
      });
    }

    if (kDebugMode) {
      print('✅ All notifications dependencies setup complete');
    }

  } catch (e) {
    if (kDebugMode) {
      print('❌ Critical error in dependency setup: $e');
    }
    
    // Emergency fallback setup
    _setupFallbackDependencies();
  }
}

void _setupFallbackDependencies() {
  try {
    if (kDebugMode) {
      print('🔧 Setting up fallback dependencies...');
    }
    
    // Clear any existing registrations
    if (getIt.isRegistered<MockNotificationsRepository>()) {
      getIt.unregister<MockNotificationsRepository>();
    }
    if (getIt.isRegistered<NotificationsCubit>()) {
      getIt.unregister<NotificationsCubit>();
    }
    
    // Register simple fallback instances
    getIt.registerLazySingleton<MockNotificationsRepository>(
      () => MockNotificationsRepository(),
    );
    
    getIt.registerFactory<NotificationsCubit>(
      () => NotificationsCubit(getIt<MockNotificationsRepository>()),
    );
    
    if (kDebugMode) {
      print('✅ Fallback dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Critical error in fallback setup: $e');
    }
  }
}

// Helper function to reset dependencies (for testing)
Future<void> resetNotificationsDependencies() async {
  try {
    if (kDebugMode) {
      print('🔄 Resetting notifications dependencies...');
    }
    
    if (getIt.isRegistered<NotificationsCubit>()) {
      getIt.unregister<NotificationsCubit>();
    }
    if (getIt.isRegistered<MockNotificationsRepository>()) {
      getIt.unregister<MockNotificationsRepository>();
    }
    
    await setupNotificationsDependencies();
    if (kDebugMode) {
      print('✅ Dependencies reset complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error resetting dependencies: $e');
    }
  }
}

// Helper function to check dependency health
bool checkNotificationsDependenciesHealth() {
  try {
    final hasRepository = getIt.isRegistered<MockNotificationsRepository>();
    final hasCubit = getIt.isRegistered<NotificationsCubit>();
    
    if (kDebugMode) {
      print('🩺 Dependencies health check:');
    }
    if (kDebugMode) {
      print('   Repository: ${hasRepository ? "✅" : "❌"}');
    }
    if (kDebugMode) {
      print('   Cubit: ${hasCubit ? "✅" : "❌"}');
    }
    
    return hasRepository && hasCubit;
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error checking dependencies health: $e');
    }
    return false;
  }
}