import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class  StateRow extends StatelessWidget {
  const StateRow ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.blue),
const SizedBox(width: 6),
Text("Friday, July 17 • 4:00pm", style: AppTextStyles.black14w500),
const Spacer(),
Text(
"Reschedule",
style: AppTextStyles.black14w500.copyWith(color: Colors.blue),
),
],
);
  }
}
