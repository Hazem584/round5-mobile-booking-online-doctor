import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';



class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showConfirmDeleteAccountDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: ColorsManger.lightGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset("assets/svgs/user_profile.svg", height: 24.h),

                horizontalSpace(5.w),
                Text("Delete account", style: TextStyles.font16BlackRegular),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmDeleteAccountDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(52),
          ),
          title: Center(child: const Text('Delete Account')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Divider(color: ColorsManger.buttonCancelColor),
                Text(
                  'Are you sure you want to delete your account?',
                  style: TextStyles.font14DarkGrayRegular,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, 30),
                backgroundColor: ColorsManger.buttonCancelColor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Cancel', style: TextStyles.font14BlackMedium),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, 30),

                backgroundColor: ColorsManger.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Yes,delete', style: TextStyles.font14WhiteMedium),
            ),
          ],
        );
      },
    );
  }
}
