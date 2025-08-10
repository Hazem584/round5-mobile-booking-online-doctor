
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_style.dart';

class ReviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Review and Rating", style: AppTextStyles.black23w700),
        const Spacer(),
        Image.asset("assets/icons/Pen.png", height: 20, width: 20),
        Text("add review", style: AppTextStyles.blue15w400),
      ],
    );
  }
}
