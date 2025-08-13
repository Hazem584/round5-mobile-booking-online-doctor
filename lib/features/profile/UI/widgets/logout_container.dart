import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/service/auth_manager.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/routes/routes.dart';

class LogoutContainer extends StatefulWidget {
  const LogoutContainer({super.key});

  @override
  State<LogoutContainer> createState() => _LogoutContainerState();
}

class _LogoutContainerState extends State<LogoutContainer> {
  bool _isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: _isLoggingOut
            ? null
            : () {
                _showLogoutDialog(context);
              },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(Assets.assetsImagesLogout, width: 25.w, height: 25.h),
              horizontalSpace(10),
              Text('Log out', style: TextStyles.font16RedNormal),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    if (_isLoggingOut) return; // Prevent multiple dialogs

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
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

                  if (_isLoggingOut) ...[
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

                  if (!_isLoggingOut) ...[
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
                              onPressed: () async {
                                await _performLogout(
                                  dialogContext,
                                  setDialogState,
                                );
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
            );
          },
        );
      },
    );
  }

  Future<void> _performLogout(
    BuildContext dialogContext,
    StateSetter setDialogState,
  ) async {
    if (_isLoggingOut) return;

    // Update dialog state to show loading
    setDialogState(() {
      _isLoggingOut = true;
    });

    // Also update widget state
    if (mounted) {
      setState(() {
        _isLoggingOut = true;
      });
    }

    try {
      // Clear auth data
      await AuthManager.clearAuth();

      // Close dialog safely
      if (Navigator.of(dialogContext).canPop()) {
        Navigator.of(dialogContext).pop();
      }

      // Navigate to onboarding
      if (mounted && Navigator.of(context).canPop()) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(Routes.onboarding, (route) => false);
      }

      // Show success message after a delay
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You have successfully logged out.'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      });
    } catch (e) {
      print('Error during logout: $e');

      // Still close dialog and navigate even on error
      if (Navigator.of(dialogContext).canPop()) {
        Navigator.of(dialogContext).pop();
      }

      if (mounted && Navigator.of(context).canPop()) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(Routes.onboarding, (route) => false);
      }

      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout completed with issues: $e'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
    } finally {
      // Reset logging out state
      if (mounted) {
        setState(() {
          _isLoggingOut = false;
        });
      }
    }
  }
}
