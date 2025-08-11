import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'card_type.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Payment Method"),
        verticalSpace(30),
        CardType(
          text: "Axis Bank 450***49",
          leftSvg: "assets/svgs/visa.svg",
          rightIcon: Icon(
            Icons.circle_outlined,
            color: ColorsManger.darkGray,
            size: 20.sp,
          ),
        ),
        verticalSpace(30),
      ],
    );
  }
}
