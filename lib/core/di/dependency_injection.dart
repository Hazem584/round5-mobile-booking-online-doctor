import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/auth/signup/data/repository/signup_repository.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/auth/login/data/repositories/login_repository.dart';
import '../../features/auth/login/data/repositories/phone_login_repository.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/home/data/datasource/doctor_remote_data_source.dart';
import '../../features/home/data/datasource/doctor_remote_data_source_impl.dart';
import '../../features/home/data/repo/doctor_repo_impl.dart';
import '../../features/home/domain/repo/doctor_repo.dart';
import '../../features/notifications/data/repos/notifications_repository.dart';
import '../../features/notifications/logic/cubit/notifications_cubit.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/profile/data/datasources/profile_remote_data_source_impl.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/profile/domain/repos/profile_repo.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up all dependencies...');
    }

    await _setupCoreDependencies();
    await _setupDoctorDependencies();
    await _setupNotificationsDependencies();
    await _setupAuthDependencies();
    await _setupProfileDependencies();

    if (_checkDependenciesHealth()) {
      if (kDebugMode) {
        print('✅ All dependencies setup complete and healthy');
      }
    } else {
      if (kDebugMode) {
        print('⚠ Some dependencies may have issues');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Critical error in dependency setup: $e');
    }
    await _setupFallbackDependencies();
  }
}

Future<void> _setupCoreDependencies() async {
  try {
    // Register Dio first
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerLazySingleton<Dio>(() {
        final dio = Dio();
        dio.options.connectTimeout = const Duration(seconds: 10);
        dio.options.receiveTimeout = const Duration(seconds: 10);
        dio.options.sendTimeout = const Duration(seconds: 10);
        dio.options.baseUrl =
            'http://round5-online-booking-with-doctor-api.huma-volve.com/api/';

        if (kDebugMode) {
          dio.interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
              requestHeader: true,
              responseHeader: false,
              error: true,
              logPrint: (obj) {
                print('🌐 HTTP: $obj');
              },
            ),
          );
        }

        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              options.headers['Content-Type'] = 'application/json';
              options.headers['Accept'] = 'application/json';
              handler.next(options);
            },
            onResponse: (response, handler) {
              if (kDebugMode) {
                print(
                  '✅ API Response: ${response.statusCode} ${response.requestOptions.path}',
                );
              }
              handler.next(response);
            },
            onError: (error, handler) {
              _handleDioError(error);
              handler.next(error);
            },
          ),
        );

        if (kDebugMode) {
          print(
            '✅ Dio configured successfully with base URL: ${dio.options.baseUrl}',
          );
        }
        return dio;
      });
    }

    // Register ApiService
    if (!getIt.isRegistered<ApiService>()) {
      getIt.registerLazySingleton<ApiService>(() => ApiService());
      if (kDebugMode) {
        print('✅ ApiService registered successfully');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error setting up core dependencies: $e');
    }
  }
}

Future<void> _setupAuthDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up auth dependencies...');
    }

    // Register Login Repository
    if (!getIt.isRegistered<LoginRepository>()) {
      getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
      if (kDebugMode) {
        print('✅ LoginRepository registered');
      }
    }

    // Register Phone Login Repository
    if (!getIt.isRegistered<PhoneLoginRepository>()) {
      getIt.registerLazySingleton<PhoneLoginRepository>(
        () => PhoneLoginRepository(apiService: getIt<ApiService>()),
      );
      if (kDebugMode) {
        print('✅ PhoneLoginRepository registered');
      }
    }

    // Register Login Cubits
    if (!getIt.isRegistered<LoginCubit>()) {
      getIt.registerFactory<LoginCubit>(
        () => LoginCubit(getIt<LoginRepository>()),
      );
      if (kDebugMode) {
        print('✅ LoginCubit registered');
      }
    }

    if (!getIt.isRegistered<LoginWithPhoneCubit>()) {
      getIt.registerFactory<LoginWithPhoneCubit>(
        () => LoginWithPhoneCubit(getIt<PhoneLoginRepository>()),
      );
      if (kDebugMode) {
        print('✅ LoginWithPhoneCubit registered');
      }
    }

    // Register Signup Repository
    if (!getIt.isRegistered<SignupRepository>()) {
      getIt.registerLazySingleton<SignupRepository>(
        () => SignupRepository(
          dio: getIt<Dio>(),
          apiService: getIt<ApiService>(),
        ),
      );
      if (kDebugMode) {
        print('✅ SignupRepository registered');
      }
    }

    // Register Signup Cubit
    if (!getIt.isRegistered<SignupCubit>()) {
      getIt.registerFactory<SignupCubit>(
        () => SignupCubit(getIt<SignupRepository>()),
      );
      if (kDebugMode) {
        print('✅ SignupCubit registered');
      }
    }

    if (kDebugMode) {
      print('✅ Auth dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error setting up auth dependencies: $e');
    }
  }
}

Future<void> _setupDoctorDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up doctor dependencies...');
    }

    if (!getIt.isRegistered<DoctorRemoteDataSource>()) {
      getIt.registerLazySingleton<DoctorRemoteDataSource>(
        () => DoctorsRemoteDataSourceImpl(),
      );
    }

    if (!getIt.isRegistered<DoctorRepo>()) {
      getIt.registerLazySingleton<DoctorRepo>(
        () => DoctorRepoImpl(
          doctorRemoteDataSource: getIt<DoctorRemoteDataSource>(),
        ),
      );
    }

    if (kDebugMode) {
      print('✅ Doctor dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error setting up doctor dependencies: $e');
    }
  }
}

Future<void> _setupNotificationsDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up notifications dependencies...');
    }

    if (!getIt.isRegistered<MockNotificationsRepository>()) {
      getIt.registerLazySingleton<MockNotificationsRepository>(() {
        try {
          final repository = MockNotificationsRepository(dio: getIt<Dio>());
          if (kDebugMode) {
            print(
              '✅ MockNotificationsRepository registered with shared Dio instance',
            );
          }
          return repository;
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error creating MockNotificationsRepository with DI: $e');
            print('🔄 Creating fallback repository without DI');
          }
          return MockNotificationsRepository();
        }
      });
    }

    if (!getIt.isRegistered<NotificationsCubit>()) {
      getIt.registerFactory<NotificationsCubit>(() {
        try {
          final cubit = NotificationsCubit(
            getIt<MockNotificationsRepository>(),
          );
          if (kDebugMode) {
            print('✅ NotificationsCubit registered');
          }
          return cubit;
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error creating NotificationsCubit with DI: $e');
            print('🔄 Creating fallback cubit');
          }
          return NotificationsCubit(MockNotificationsRepository());
        }
      });
    }

    if (kDebugMode) {
      print('✅ Notifications dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error setting up notifications dependencies: $e');
    }
  }
}

Future<void> _setupProfileDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up profile dependencies...');
    }

    if (!getIt.isRegistered<ProfileRemoteDataSource>()) {
      getIt.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(dio: getIt<Dio>()),
      );
      if (kDebugMode) {
        print('✅ ProfileRemoteDataSource registered');
      }
    }

    if (!getIt.isRegistered<ProfileRepo>()) {
      getIt.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(
          profileRemoteDataSource: getIt<ProfileRemoteDataSource>(),
        ),
      );
      if (kDebugMode) {
        print('✅ ProfileRepo registered');
      }
    }

    if (!getIt.isRegistered<ProfileCubit>()) {
      getIt.registerFactory<ProfileCubit>(() {
        final cubit = ProfileCubit(getIt<ProfileRepo>());
        cubit.getProfileData();
        return cubit;
      });
      if (kDebugMode) {
        print('✅ ProfileCubit registered');
      }
    }

    if (kDebugMode) {
      print('✅ Profile dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error setting up profile dependencies: $e');
    }
  }
}

void _handleDioError(DioException error) {
  if (kDebugMode) {
    switch (error.response?.statusCode) {
      case 401:
        print('🔐 Unauthorized access - token may be expired');
        break;
      case 403:
        print('🚫 Forbidden access');
        break;
      case 404:
        print('🔍 Endpoint not found: ${error.requestOptions.path}');
        break;
      case 500:
        print('🔥 Server error');
        break;
      case 502:
        print('🌐 Bad Gateway');
        break;
      case 503:
        print('⚠ Service Unavailable');
        break;
      default:
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          print('⏰ Request timeout for ${error.requestOptions.path}');
        } else if (error.type == DioExceptionType.connectionError) {
          print('🌐 Connection error: ${error.message}');
        } else {
          print(
            '🌐 Network error (${error.response?.statusCode}): ${error.message}',
          );
        }
    }
  }
}

Future<void> _setupFallbackDependencies() async {
  try {
    if (kDebugMode) {
      print('🔧 Setting up fallback dependencies...');
    }

    _clearRegistrations();

    if (!getIt.isRegistered<ApiService>()) {
      getIt.registerLazySingleton<ApiService>(() => ApiService());
    }

    if (!getIt.isRegistered<MockNotificationsRepository>()) {
      getIt.registerLazySingleton<MockNotificationsRepository>(
        () => MockNotificationsRepository(),
      );
    }

    if (!getIt.isRegistered<NotificationsCubit>()) {
      getIt.registerFactory<NotificationsCubit>(
        () => NotificationsCubit(getIt<MockNotificationsRepository>()),
      );
    }

    if (!getIt.isRegistered<ProfileRemoteDataSource>()) {
      getIt.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(),
      );
    }

    if (!getIt.isRegistered<ProfileRepo>()) {
      getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());
    }

    if (!getIt.isRegistered<ProfileCubit>()) {
      getIt.registerFactory<ProfileCubit>(
        () => ProfileCubit(getIt<ProfileRepo>()),
      );
    }

    if (!getIt.isRegistered<SignupRepository>()) {
      getIt.registerLazySingleton<SignupRepository>(
        () => SignupRepository(
          dio: getIt<Dio>(),
          apiService: getIt<ApiService>(),
        ),
      );
    }

    if (!getIt.isRegistered<SignupCubit>()) {
      getIt.registerFactory<SignupCubit>(
        () => SignupCubit(getIt<SignupRepository>()),
      );
    }

    if (kDebugMode) {
      print('✅ Fallback dependencies setup complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Critical error in fallback setup: $e');
    }
  }
}

void _clearRegistrations() {
  try {
    final registrationsToRemove = [
      ApiService,
      MockNotificationsRepository,
      NotificationsCubit,
      ProfileRemoteDataSource,
      ProfileRepo,
      ProfileCubit,
      SignupRepository,
      SignupCubit,
      LoginRepository,
      PhoneLoginRepository,
      LoginCubit,
      LoginWithPhoneCubit,
    ];

    for (final type in registrationsToRemove) {
      if (getIt.isRegistered(instance: type)) {
        getIt.unregister(instance: type);
        if (kDebugMode) {
          print('🧹 Cleared registration for $type');
        }
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('⚠ Error clearing registrations: $e');
    }
  }
}

bool _checkDependenciesHealth() {
  try {
    final hasDio = getIt.isRegistered<Dio>();
    final hasApiService = getIt.isRegistered<ApiService>();
    final hasNotificationRepository = getIt
        .isRegistered<MockNotificationsRepository>();
    final hasNotificationCubit = getIt.isRegistered<NotificationsCubit>();
    final hasDoctorRepo = getIt.isRegistered<DoctorRepo>();
    final hasDoctorDataSource = getIt.isRegistered<DoctorRemoteDataSource>();
    final hasProfileDataSource = getIt.isRegistered<ProfileRemoteDataSource>();
    final hasProfileRepo = getIt.isRegistered<ProfileRepo>();
    final hasProfileCubit = getIt.isRegistered<ProfileCubit>();
    final hasSignupRepo = getIt.isRegistered<SignupRepository>();
    final hasSignupCubit = getIt.isRegistered<SignupCubit>();

    if (kDebugMode) {
      print('🩺 Dependencies health check:');
      print('   Dio: ${hasDio ? "✅" : "❌"}');
      print('   ApiService: ${hasApiService ? "✅" : "❌"}');
      print(
        '   Notification Repository: ${hasNotificationRepository ? "✅" : "❌"}',
      );
      print('   Notification Cubit: ${hasNotificationCubit ? "✅" : "❌"}');
      print('   Doctor Repository: ${hasDoctorRepo ? "✅" : "❌"}');
      print('   Doctor DataSource: ${hasDoctorDataSource ? "✅" : "❌"}');
      print('   Profile DataSource: ${hasProfileDataSource ? "✅" : "❌"}');
      print('   Profile Repository: ${hasProfileRepo ? "✅" : "❌"}');
      print('   Profile Cubit: ${hasProfileCubit ? "✅" : "❌"}');
      print('   Signup Repository: ${hasSignupRepo ? "✅" : "❌"}');
      print('   Signup Cubit: ${hasSignupCubit ? "✅" : "❌"}');
    }

    final criticalDependencies =
        hasDio &&
        hasApiService &&
        hasNotificationRepository &&
        hasNotificationCubit &&
        hasProfileDataSource &&
        hasProfileRepo &&
        hasProfileCubit &&
        hasSignupRepo &&
        hasSignupCubit;

    if (kDebugMode) {
      print(
        '🎯 Critical dependencies healthy: ${criticalDependencies ? "✅" : "❌"}',
      );
    }

    return criticalDependencies;
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error checking dependencies health: $e');
    }
    return false;
  }
}

Future<void> resetAllDependencies() async {
  try {
    if (kDebugMode) {
      print('🔄 Resetting all dependencies...');
    }

    await getIt.reset();
    await setupGetIt();

    if (kDebugMode) {
      print('✅ All dependencies reset complete');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error resetting dependencies: $e');
    }
  }
}

Map<String, bool> getDependencyInfo() {
  return {
    'Dio': getIt.isRegistered<Dio>(),
    'ApiService': getIt.isRegistered<ApiService>(),
    'NotificationRepository': getIt.isRegistered<MockNotificationsRepository>(),
    'NotificationCubit': getIt.isRegistered<NotificationsCubit>(),
    'DoctorRepo': getIt.isRegistered<DoctorRepo>(),
    'DoctorDataSource': getIt.isRegistered<DoctorRemoteDataSource>(),
    'ProfileDataSource': getIt.isRegistered<ProfileRemoteDataSource>(),
    'ProfileRepo': getIt.isRegistered<ProfileRepo>(),
    'ProfileCubit': getIt.isRegistered<ProfileCubit>(),
    'SignupRepository': getIt.isRegistered<SignupRepository>(),
    'SignupCubit': getIt.isRegistered<SignupCubit>(),
    'LoginRepository': getIt.isRegistered<LoginRepository>(),
    'PhoneLoginRepository': getIt.isRegistered<PhoneLoginRepository>(),
    'LoginCubit': getIt.isRegistered<LoginCubit>(),
    'LoginWithPhoneCubit': getIt.isRegistered<LoginWithPhoneCubit>(),
  };
}

Future<bool> testAllDependencies() async {
  try {
    if (kDebugMode) {
      print('🧪 Testing all dependencies...');
    }

    final dio = getIt<Dio>();
    if (kDebugMode) {
      print('✅ Dio instance created: ${dio.options.baseUrl}');
    }

    final apiService = getIt<ApiService>();
    if (kDebugMode) {
      print('✅ ApiService instance created');
    }

    final signupRepo = getIt<SignupRepository>();
    if (kDebugMode) {
      print('✅ SignupRepository instance created');
    }

    final signupCubit = getIt<SignupCubit>();
    if (kDebugMode) {
      print('✅ SignupCubit instance created');
    }

    final notificationRepo = getIt<MockNotificationsRepository>();
    if (kDebugMode) {
      print('✅ NotificationRepository instance created');
    }

    final notificationCubit = getIt<NotificationsCubit>();
    if (kDebugMode) {
      print('✅ NotificationsCubit instance created');
    }

    try {
      final profileDataSource = getIt<ProfileRemoteDataSource>();
      if (kDebugMode) {
        print('✅ ProfileRemoteDataSource instance created');
      }

      final profileRepo = getIt<ProfileRepo>();
      if (kDebugMode) {
        print('✅ ProfileRepo instance created');
      }

      final profileCubit = getIt<ProfileCubit>();
      if (kDebugMode) {
        print('✅ ProfileCubit instance created');
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠ Profile dependencies not available: $e');
      }
    }

    try {
      final doctorRepo = getIt<DoctorRepo>();
      if (kDebugMode) {
        print('✅ DoctorRepo instance created');
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠ DoctorRepo not available: $e');
      }
    }

    if (kDebugMode) {
      print('✅ All available dependencies tested successfully');
    }

    return true;
  } catch (e) {
    if (kDebugMode) {
      print('❌ Dependency test failed: $e');
    }
    return false;
  }
}