import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/features/profile/logic/cubit/profile_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/routes/routes.dart';

class CustomLogoutModal {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        bool isNavigated = false; // Flag to prevent multiple navigation

        return BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoggedOut && !isNavigated) {
              isNavigated = true;

              // Close dialog first
              if (Navigator.of(dialogContext).canPop()) {
                Navigator.of(dialogContext).pop();
              }

              // Small delay to ensure dialog is closed before navigation
              Future.delayed(Duration(milliseconds: 100), () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.onboarding,
                    (route) => false,
                  );

                  // Show success message after navigation
                  Future.delayed(Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  });
                }
              });
            } else if (state is ProfileError && !isNavigated) {
              // Even on error, we might want to logout locally
              isNavigated = true;

              if (Navigator.of(dialogContext).canPop()) {
                Navigator.of(dialogContext).pop();
              }

              Future.delayed(Duration(milliseconds: 100), () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.onboarding,
                    (route) => false,
                  );

                  Future.delayed(Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Logged out locally'),
                          backgroundColor: Colors.orange,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  });
                }
              });
            }
          },
          builder: (context, state) {
            final isLoggingOut = state is ProfileLoggingOut;

            return PopScope(
              canPop: !isLoggingOut, // Prevent back during logout
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                contentPadding: EdgeInsets.all(24.w),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text('Logout', style: TextStyles.font20LightBlackNormal),
                    verticalSpace(16),

                    // Content based on state
                    if (isLoggingOut) ...[
                      CircularProgressIndicator(color: ColorsManger.lightBlue),
                      verticalSpace(16),
                      Text(
                        'Logging out...',
                        textAlign: TextAlign.center,
                        style: TextStyles.font14lightGrayNormal,
                      ),
                    ] else ...[
                      Text(
                        'Are you sure you want to log out?',
                        textAlign: TextAlign.center,
                        style: TextStyles.font14lightGrayNormal,
                      ),
                    ],
                    verticalSpace(24),
                    if (!isLoggingOut) ...[
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if (Navigator.of(dialogContext).canPop()) {
                                    Navigator.of(dialogContext).pop();
                                  }
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyles.font16LightBlackNormal,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: ColorsManger.lightBlue,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  try {
                                    context.read<ProfileCubit>().logout();
                                  } catch (e) {
                                    print('Error triggering logout: $e');
                                    // Fallback - close dialog and navigate
                                    if (!isNavigated) {
                                      isNavigated = true;
                                      Navigator.of(dialogContext).pop();
                                      Navigator.of(
                                        context,
                                      ).pushNamedAndRemoveUntil(
                                        Routes.onboarding,
                                        (route) => false,
                                      );
                                    }
                                  }
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  'Yes, Logout',
                                  style: TextStyles.font16WhiteNormal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
