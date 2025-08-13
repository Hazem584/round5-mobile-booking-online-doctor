import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? GetIt.instance<Dio>();

  @override
  Future<Map<String, dynamic>> getProfileData(String token) async {
    try {
      final response = await _dio.get(
        'profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (kDebugMode) {
        print('✅ Profile data fetched successfully');
      }

      return {
        'success': true,
        'data': response.data,
      };
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Error fetching profile data: ${e.response?.statusCode}');
      }
      
      return {
        'success': false,
        'message': _handleDioError(e),
      };
    } catch (e) {
      if (kDebugMode) {
        print('❌ Unexpected error fetching profile data: $e');
      }
      
      return {
        'success': false,
        'message': 'Unexpected error fetching profile data',
      };
    }
  }

  @override
  Future<Map<String, dynamic>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  }) async {
    try {
      final body = {
        'name': name,
        'email': email,
        'phone': phone,
        'birthdate': birthdate,
      };

      final response = await _dio.post(
        'profile',
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (kDebugMode) {
        print('✅ Profile updated successfully');
      }

      return {
        'success': true,
        'data': response.data,
        'message': response.data['message'] ?? 'Updated successfully',
      };
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Error updating profile: ${e.response?.statusCode}');
      }
      
      return {
        'success': false,
        'message': _handleDioError(e),
      };
    } catch (e) {
      if (kDebugMode) {
        print('❌ Unexpected error updating profile: $e');
      }
      
      return {
        'success': false,
        'message': 'Unexpected error updating profile',
      };
    }
  }

  @override
  Future<Map<String, dynamic>> logout(String token) async {
    try {
      if (kDebugMode) {
        print('🔄 Starting logout process...');
      }

      final response = await _dio.post(
        'logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (kDebugMode) {
        print('✅ Logout successful');
        print('Response: ${response.data}');
      }

      return {
        'success': true,
        'message': response.data['message'] ?? 'You have successfully logged out.',
        'data': response.data,
      };
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Error during logout: ${e.response?.statusCode}');
        print('Error response: ${e.response?.data}');
      }
      
      return {
        'success': false,
        'message': _handleDioError(e),
      };
    } catch (e) {
      if (kDebugMode) {
        print('❌ Unexpected error during logout: $e');
      }
      
      return {
        'success': false,
        'message': 'Unexpected error during logout',
      };
    }
  }

  String _handleDioError(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return 'Data is not valid';
      case 401:
        return 'The Session has expired Please login again';
      case 403:
        return 'You do not have permission to perform this action';
      case 404:
        return 'The requested resource was not found';
      case 422:
        return e.response?.data['message'] ?? 'Validation error';
      case 500:
        return 'Internal Server Error';
      default:
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          return 'Request timeout';
        } else if (e.type == DioExceptionType.connectionError) {
          return 'Connection error: ${e.message}';
        }
        return 'Something went wrong please try again';
    }
  }
}