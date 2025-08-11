
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class PriceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
height: 70,

        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08), // لون الشادو
              blurRadius: 8, // درجة النعومة
              offset: const Offset(0, -2), // اتجاهه لفوق
            ),
          ],
        ),
        child: Row(
          children: [
            Text("Price", style: AppTextStyles.black23w700),
            Text("\\hours", style: AppTextStyles.grey15w400),
            const Spacer(),
            Text("350\$", style: AppTextStyles.red15w400),
          ],
        ),
      ),
    );
  }
}
