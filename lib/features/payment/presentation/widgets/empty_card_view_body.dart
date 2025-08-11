import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class EmptyCardViewBody extends StatelessWidget {
  const EmptyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Payment Method"),
        verticalSpace(150.h),
        Image.asset("assets/images/credit-card 1.png", fit: BoxFit.cover),
        verticalSpace(15.h),
        Text("Nothing to display here!", style: TextStyles.font24BlackRegular),
        verticalSpace(10.h),
        Text(
          "Add your card to make payment easier",
          style: TextStyles.font16DarkGrayRegular,
        ),
      ],
    );
  }
}
