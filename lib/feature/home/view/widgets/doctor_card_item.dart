import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class DoctorCardItem extends StatelessWidget {
  const DoctorCardItem({
    super.key, required this.image, required this.name, required this.specialist,required this.location, required this.rating, required this.time,
  });

  final String image,name,specialist,location,rating,time;
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
            child: Image.network(image, width: 80,height: 80, fit: BoxFit.cover,)
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppStyle.regular14,),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(specialist,style: AppStyle.regular12.copyWith(color: AppColors.greyColor)),
                    Text(' | ',style: AppStyle.regular12.copyWith(color: AppColors.greyColor)),
                    Text(location,style: AppStyle.regular12.copyWith(color: AppColors.greyColor)),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/rating.svg'),
                    const SizedBox(width: 4.0),
                    Text(rating, style: AppStyle.medium12),
                    const SizedBox(width: 12.0),
                    SvgPicture.asset('assets/icons/time.svg'),
                    const SizedBox(width: 4.0),
                    Text(time, style: AppStyle.medium12,),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/icons/Favourite-Heart.svg', width: 20, height: 20,),
          )
        ],
      ),
    );
  }
}