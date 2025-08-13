import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';
import 'package:mobile_booking_online_doctor/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl({
    ProfileRemoteDataSource? profileRemoteDataSource,
  }) : _profileRemoteDataSource = profileRemoteDataSource ?? GetIt.instance<ProfileRemoteDataSource>();

  @override
  Future<Map<String, dynamic>> getProfileData() async {
    try {
      final token = await _getAuthToken();
      if (token.isEmpty) {
        return {
          'success': false,
          'message': 'Please log in first',
        };
      }

      return await _profileRemoteDataSource.getProfileData(token);
    } catch (e) {
      if (kDebugMode) {
        print('❌ Repository error getting profile data: $e');
      }
      return {
        'success': false,
        'message': 'Something went wrong, please try again',
      };
    }
  }

  @override
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  }) async {
    try {
      final token = await _getAuthToken();
      if (token.isEmpty) {
        return {
          'success': false,
          'message': 'Please log in first',
        };
      }

      return await _profileRemoteDataSource.updateProfile(
        token: token,
        name: name,
        email: email,
        phone: phone,
        birthdate: birthdate,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Repository error updating profile: $e');
      }
      return {
        'success': false,
        'message': 'Something went wrong, please try again',
      };
    }
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    try {
      if (kDebugMode) {
        print('🔄 Starting logout process in repository...');
      }

      final token = await _getAuthToken();
      if (token.isEmpty) {
        if (kDebugMode) {
          print('⚠️ No token found, clearing local auth data only');
        }
        await AuthManager.clearAuth();
        return {
          'success': true,
          'message': 'Logged out successfully',
        };
      }
      final result = await _profileRemoteDataSource.logout(token);
      
      if (result['success'] == true) {
        await AuthManager.clearAuth();
        if (kDebugMode) {
          print('✅ Logout successful and local data cleared');
        }
      } else {
        await AuthManager.clearAuth();
        if (kDebugMode) {
          print('⚠️ API logout failed but local data cleared');
        }
      }

      return result;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Repository error during logout: $e');
      }
      try {
        await AuthManager.clearAuth();
        if (kDebugMode) {
          print('🧹 Local auth data cleared despite error');
        }
      } catch (clearError) {
        if (kDebugMode) {
          print('❌ Error clearing local auth data: $clearError');
        }
      }
      
      return {
        'success': false,
        'message': 'Logout completed but with some issues',
      };
    }
  }

  Future<String> _getAuthToken() async {
    try {
      return await AuthManager.getAuthToken() ?? '';
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting auth token: $e');
      }
      return '';
    }
  }
}