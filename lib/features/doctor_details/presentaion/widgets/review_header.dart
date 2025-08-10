import 'package:flutter/cupertino.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';


class ReviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Review and Rating", style: TextStyles.black23w700),
        const Spacer(),
        Image.asset(Assets.assetsIconsPen, height: 20, width: 20),
        Text("add review", style: TextStyles.blue15w400),
      ],
    );
  }
}
