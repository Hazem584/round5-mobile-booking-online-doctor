import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class ElevatButton extends StatelessWidget {
  const ElevatButton({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 130,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 13),),
      ),
    );
  }
}

