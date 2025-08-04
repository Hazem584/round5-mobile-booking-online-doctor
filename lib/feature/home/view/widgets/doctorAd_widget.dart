import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/decorative_circle.dart';

class DoctorAdWidget extends StatelessWidget {
  const DoctorAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: const Color(0xFF1976D2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, right: 130),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trusted doctor on your schedule 😊",
                      style: AppStyle.plusJakartaSansSemiB,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Consult A Doctor\n— Book Today!",
                      style: AppStyle.plusJakartaSansBold24,
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 28,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              DecorativeCircle(
                                leftPositon: 33,
                                image: Assets.assetsImagesEllipse7,
                              ),
                              DecorativeCircle(
                                leftPositon: 16,
                                image: Assets.assetsImagesEllipse6,
                              ),
                              DecorativeCircle(
                                leftPositon: 0,
                                image: Assets.assetsImagesEllipse5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "30,000+ ",
                              style: AppStyle.plusJakartaSansSemiB.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              " Happy Patients",
                              style: AppStyle.plusJakartaSansSemiB,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 130,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    Assets.assetsImagesDoctor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
