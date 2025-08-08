import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, required this.txt});
final String txt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 130,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom( side: BorderSide(
          color:AppColors.primary,

        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10),  ),
        ),
        child: Text(txt,style:  TextStyle(color: AppColors.primary,fontSize: 13),),
      ),
    );

  }
  }
