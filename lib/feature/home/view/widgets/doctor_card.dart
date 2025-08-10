import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 183,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/images/background.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
              child: Image.asset(
                'assets/images/doctor-image1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trusted doctor on your schedule 😉',
                  style: AppStyle.semiBold10.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Consult A Doctor\n— Book Today!',
                  style: AppStyle.bold18.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .23,
                      height: 32,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 44,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient3.png',
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient2.png',
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient1.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30.000+',
                          style: AppStyle.extraBold10.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Happy Patients',
                          style: AppStyle.regular10.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
