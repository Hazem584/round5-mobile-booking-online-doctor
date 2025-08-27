import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_booking_online_doctor/features/profile/domain/repos/profile_repo.dart';
import '../../domain/entities/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  bool _isDisposed = false;
  bool _isLoading = false; // Add loading flag to prevent multiple calls

  ProfileCubit(this._profileRepo) : super(ProfileInitial()) {
    if (kDebugMode) {
      print('🏗️ ProfileCubit created');
    }
  }

  @override
  Future<void> close() {
    _isDisposed = true;
    if (kDebugMode) {
      print('🗑️ ProfileCubit disposed');
    }
    return super.close();
  }

  void _safeEmit(ProfileState state) {
    if (!_isDisposed && !isClosed) {
      if (kDebugMode) {
        print('🔄 Emitting state: ${state.runtimeType}');
      }
      emit(state);
    }
  }

  Future<void> getProfileData() async {
    if (_isDisposed) {
      if (kDebugMode) {
        print('⚠️ ProfileCubit is disposed, skipping getProfileData');
      }
      return;
    }

    if (_isLoading) {
      if (kDebugMode) {
        print('⚠️ Already loading profile data, skipping duplicate call');
      }
      return;
    }

    _isLoading = true;
    if (kDebugMode) {
      print('🔄 Starting getProfileData...');
    }

    _safeEmit(ProfileLoading());

    try {
      if (kDebugMode) {
        print('🌐 Calling profile repository...');
      }

      final result = await _profileRepo.getProfileData();

      if (kDebugMode) {
        print('📥 Repository result: $result');
      }

      if (_isDisposed) return;

      if (result['success'] == true) {
        if (kDebugMode) {
          print('✅ Profile API call successful');
          print('📊 Response data structure: ${result['data']?.keys}');
        }

        final userData = result['data']['data']['user'];
        if (kDebugMode) {
          print('👤 User data: $userData');
        }

        final profile = ProfileModel.fromJson(userData);
        if (kDebugMode) {
          print('🎭 Profile model created: ${profile.name}');
        }

        _safeEmit(ProfileLoaded(profile));
      } else {
        if (kDebugMode) {
          print('❌ Profile API call failed: ${result['message']}');
        }
        _safeEmit(ProfileError(result['message']));
      }
    } catch (e) {
      if (_isDisposed) return;

      if (kDebugMode) {
        print('❌ Exception in getProfileData: $e');
        print('Stack trace: ${StackTrace.current}');
      }
      _safeEmit(ProfileError('Failed to load profile data'));
    } finally {
      _isLoading = false;
      if (kDebugMode) {
        print('✅ getProfileData completed, _isLoading = false');
      }
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  }) async {
    if (_isDisposed) return;

    _safeEmit(ProfileUpdating());

    try {
      final result = await _profileRepo.updateProfile(
        name: name,
        email: email,
        phone: phone,
        birthdate: birthdate,
      );

      if (_isDisposed) return;

      if (result['success'] == true) {
        _safeEmit(ProfileUpdateSuccess(result['message']));
        await getProfileData();
      } else {
        _safeEmit(ProfileUpdateError(result['message']));
      }
    } catch (e) {
      if (_isDisposed) return;

      if (kDebugMode) {
        print('❌ Cubit error updating profile: $e');
      }
      _safeEmit(ProfileUpdateError('Failed to update profile'));
    }
  }

  Future<void> logout() async {
    if (_isDisposed) return;

    _safeEmit(ProfileLoggingOut());

    try {
      if (kDebugMode) {
        print('🔄 Starting logout process in cubit...');
      }

      final result = await _profileRepo.logout();

      if (_isDisposed) return;

      if (result['success'] == true) {
        if (kDebugMode) {
          print('✅ Logout successful in cubit');
        }
        _safeEmit(
          ProfileLoggedOut(result['message'] ?? 'Logged out successfully'),
        );
      } else {
        if (kDebugMode) {
          print('⚠️ Logout completed with issues: ${result['message']}');
        }
        _safeEmit(ProfileLoggedOut(result['message'] ?? 'Logged out'));
      }
    } catch (e) {
      if (_isDisposed) return;

      if (kDebugMode) {
        print('❌ Cubit error during logout: $e');
      }
      _safeEmit(ProfileLoggedOut('Logout completed'));
    }
  }

  // Reset cubit state
  void resetToInitial() {
    if (!_isDisposed && !isClosed) {
      _isLoading = false;
      emit(ProfileInitial());
    }
  }
}
