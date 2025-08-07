import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24),
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trusted doctor on your schedule 😉',
                  style: AppStyle.semiBold10.copyWith(color: Colors.white,)
                ),
                const SizedBox(height: 8),
                Text(
                  'Consult A Doctor\n— Book Today!',
                  style: AppStyle.bold18.copyWith(color: Colors.white,)
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .25,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 48,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient3.png',
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient2.png',
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/happy-patient1.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          '30.000+',
                          style: AppStyle.extraBold12.copyWith(color: Colors.white,)
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Happy Patients',
                          style: AppStyle.regular12.copyWith(color: Colors.white)
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset('assets/images/background.svg'),
                Positioned(
                 bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      'assets/images/doctor-image1.png',
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}