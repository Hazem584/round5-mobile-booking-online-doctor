part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdateSuccess extends ProfileState {
  final String message;
  ProfileUpdateSuccess(this.message);
}

class ProfileUpdateError extends ProfileState {
  final String message;
  ProfileUpdateError(this.message);
}


class ProfileLoggingOut extends ProfileState {}

class ProfileLoggedOut extends ProfileState {
  final String message;
  ProfileLoggedOut(this.message);
}