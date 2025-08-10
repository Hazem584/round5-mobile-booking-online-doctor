
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/image (7).png"),
              ),
              const SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nabila Reyna", style: AppTextStyles.black16w700),
                  Text("30 min ago", style: AppTextStyles.grey12w400),
                ],
              ),
              const Spacer(),
              Container(
                height: 32,
                width: 61,
                decoration: const BoxDecoration(
                  color: Color(0x1AF9E000),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/star.png", height: 20, width: 20),
                    Text("4.5", style: AppTextStyles.black14w400),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Excellent service! Dr. Jessica Turner was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!",
            style: AppTextStyles.grey15w400,
          )
        ],
      ),
    );
  }
}
