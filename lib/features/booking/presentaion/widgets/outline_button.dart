import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';



class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, required this.txt});
final String txt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 130,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom( side: BorderSide(
          color:ColorsManger.primary,

        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10),  ),
        ),
        child: Text(txt,style:  TextStyle(color: ColorsManger.primary,fontSize: 13),),
      ),
    );

  }
  }
