import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';


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
                backgroundImage: AssetImage(Assets.assetsImagesGirl),
              ),
              const SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nabila Reyna", style: TextStyles.black16w700),
                  Text("30 min ago", style: TextStyles.grey12w400),
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
                    Text("4.5", style: TextStyles.black14w400),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Excellent service! Dr. Jessica Turner was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!",
            style: TextStyles.grey15w400,
          )
        ],
      ),
    );
  }
}
