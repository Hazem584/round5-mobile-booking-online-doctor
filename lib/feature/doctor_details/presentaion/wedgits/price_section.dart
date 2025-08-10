
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_style.dart';

class PriceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("Price", style: AppTextStyles.black23w700),
          Text("\\hours", style: AppTextStyles.grey15w400),
          const Spacer(),
          Text("350\$", style: AppTextStyles.red15w400),
        ],
      ),
    );
  }
}
