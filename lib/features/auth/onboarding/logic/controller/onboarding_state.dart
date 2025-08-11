part of 'onboarding_controller.dart';

class OnboardingState {
  final int currentPage;

  OnboardingState({required this.currentPage});

  OnboardingState copyWith({
    int? currentPage,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
