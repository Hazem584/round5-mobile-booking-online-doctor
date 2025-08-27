import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';
  
class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ),
  );

  ApiService() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await AuthManager.getAuthToken();
          
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            
            if (kDebugMode) {
              print('🔑 Token added to request: ${options.path}');
            }
          } else {
            if (kDebugMode) {
              print('⚠️ No token available for request: ${options.path}');
            }
          }
          
          handler.next(options);
        },
        
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('✅ API Response: ${response.statusCode} ${response.requestOptions.path}');
          }
          handler.next(response);
        },
        
        onError: (error, handler) async {
          if (kDebugMode) {
            print('❌ API Error: ${error.response?.statusCode} ${error.requestOptions.path}');
            print('Error message: ${error.message}');
          }
          if (error.response?.statusCode == 401) {
            if (kDebugMode) {
              print('🔐 Unauthorized access - clearing auth data');
            }
            await AuthManager.clearAuth();
            
            // Navigator.pushNamedAndRemoveUntil('/login', (route) => false);
          }
          
          handler.next(error);
        },
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (obj) {
            print('🌐 HTTP Log: $obj');
          },
        ),
      );
    }
  }

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  }) async {
    try {
      if (requiresAuth) {
        final isLoggedIn = await AuthManager.isLoggedIn();
        if (!isLoggedIn) {
          throw Exception("User not authenticated");
        }
        
        final isExpired = await AuthManager.isTokenExpired();
        if (isExpired) {
          throw Exception("Token expired - please login again");
        }
      }

      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('❌ GET error: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    try {
      if (requiresAuth) {
        final isLoggedIn = await AuthManager.isLoggedIn();
        if (!isLoggedIn) {
          throw Exception("User not authenticated");
        }
        
        final isExpired = await AuthManager.isTokenExpired();
        if (isExpired) {
          throw Exception("Token expired - please login again");
        }
      }

      final response = await _dio.post(
        url,
        data: body,
      );
      
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('❌ POST error: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    try {
      if (requiresAuth) {
        final isLoggedIn = await AuthManager.isLoggedIn();
        if (!isLoggedIn) {
          throw Exception("User not authenticated");
        }
        
        final isExpired = await AuthManager.isTokenExpired();
        if (isExpired) {
          throw Exception("Token expired - please login again");
        }
      }

      final response = await _dio.put(
        url,
        data: body,
      );
      
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('❌ PUT error: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String url,
    bool requiresAuth = true,
  }) async {
    try {
      if (requiresAuth) {
        final isLoggedIn = await AuthManager.isLoggedIn();
        if (!isLoggedIn) {
          throw Exception("User not authenticated");
        }
        
        final isExpired = await AuthManager.isTokenExpired();
        if (isExpired) {
          throw Exception("Token expired - please login again");
        }
      }

      final response = await _dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('❌ DELETE error: $e');
      }
      rethrow;
    }
  }

  void _handleDioException(DioException e) {
    if (kDebugMode) {
      switch (e.response?.statusCode) {
        case 400:
          print('❌ Bad Request: ${e.response?.data}');
          break;
        case 401:
          print('🔐 Unauthorized: Token may be invalid or expired');
          break;
        case 403:
          print('🚫 Forbidden: Access denied');
          break;
        case 404:
          print('🔍 Not Found: ${e.requestOptions.path}');
          break;
        case 422:
          print('⚠️ Validation Error: ${e.response?.data}');
          break;
        case 500:
          print('🔥 Internal Server Error');
          break;
        case 502:
          print('🌐 Bad Gateway');
          break;
        case 503:
          print('⚠️ Service Unavailable');
          break;
        default:
          if (e.type == DioExceptionType.connectionTimeout) {
            print('⏰ Connection timeout');
          } else if (e.type == DioExceptionType.receiveTimeout) {
            print('⏰ Receive timeout');
          } else if (e.type == DioExceptionType.sendTimeout) {
            print('⏰ Send timeout');
          } else if (e.type == DioExceptionType.connectionError) {
            print('🌐 Connection error: ${e.message}');
          } else {
            print('🌐 Network error (${e.response?.statusCode}): ${e.message}');
          }
      }
    }
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    if (kDebugMode) {
      print('🔧 Base URL updated: $baseUrl');
    }
  }

  Dio get dio => _dio;
}