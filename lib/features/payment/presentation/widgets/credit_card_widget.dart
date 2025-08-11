import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';


class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xff19D9C2), Color(0xff3B58E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svgs/spenny_logo.svg"),
              SvgPicture.asset("assets/svgs/visa_logo.svg"),
            ],
          ),
          verticalSpace(30.h),
          Text("6789 4567 5432 8903", style: TextStyles.font32WhiteBold),
          verticalSpace(30.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Seif Mohamed", style: TextStyles.font20WhiteMedium),
              Text("12/22", style: TextStyles.font20WhiteMedium),
            ],
          ),
        ],
      ),
    );
  }
}
