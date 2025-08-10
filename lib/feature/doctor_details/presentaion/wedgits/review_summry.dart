
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_style.dart';

class ReviewSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Text("4.5/5", style: AppTextStyles.black23w700),
        const Spacer(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  for (var i = 0; i < 4; i++)
                    Image.asset("assets/icons/star.png", height: 20, width: 20),
                  Image.asset("assets/icons/halfstar.png", height: 20, width: 20),
                ],
              ),
            ),
            Text("Review +1025", style: AppTextStyles.grey14w400),
          ],
        )
      ],
    );
  }
}
