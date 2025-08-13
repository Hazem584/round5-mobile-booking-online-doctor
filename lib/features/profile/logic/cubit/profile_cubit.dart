import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_booking_online_doctor/features/profile/domain/repos/profile_repo.dart';
import '../../domain/entities/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  bool _isDisposed = false;

  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  @override
  Future<void> close() {
    _isDisposed = true;
    return super.close();
  }

  void _safeEmit(ProfileState state) {
    if (!_isDisposed && !isClosed) {
      emit(state);
    }
  }

  Future<void> getProfileData() async {
    if (_isDisposed) return;

    _safeEmit(ProfileLoading());

    try {
      final result = await _profileRepo.getProfileData();

      if (_isDisposed) return;

      if (result['success'] == true) {
        final userData = result['data']['data']['user'];
        final profile = ProfileModel.fromJson(userData);
        _safeEmit(ProfileLoaded(profile));
      } else {
        _safeEmit(ProfileError(result['message']));
      }
    } catch (e) {
      if (_isDisposed) return;

      if (kDebugMode) {
        print('❌ Cubit error getting profile: $e');
      }
      _safeEmit(ProfileError('Failed to load profile data'));
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
      emit(ProfileInitial());
    }
  }
}
