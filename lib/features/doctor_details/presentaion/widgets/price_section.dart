import 'package:flutter/cupertino.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';




class PriceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("Price", style: TextStyles.black23w700),
          Text("\\hours", style: TextStyles.grey15w400),
          const Spacer(),
          Text("350\$", style: TextStyles.red15w400),
        ],
      ),
    );
  }
}
