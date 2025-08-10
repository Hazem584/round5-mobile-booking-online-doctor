import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/utils/app_style.dart';

class DoctorCardItem extends StatefulWidget {
  const DoctorCardItem({
    super.key,
    required this.image,
    required this.name,
    required this.specialist,
    required this.location,
    required this.rating,
    required this.time,
  });

  final String image, name, specialist, location, rating, time;

  @override
  State<DoctorCardItem> createState() => _DoctorCardItemState();
}

class _DoctorCardItemState extends State<DoctorCardItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Color(0xffbbc1c7)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.network(
                widget.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: AppStyle.regular14.copyWith(fontFamily: 'Georgia')),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(widget.specialist, style: AppStyle.regular12.copyWith(color: ColorsManger.greyColor,),),
                      Text(' | ', style: AppStyle.regular12.copyWith(color: ColorsManger.greyColor,),),
                      Text(widget.location, style: AppStyle.regular12.copyWith(color: ColorsManger.greyColor,),),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/rating.svg'),
                      const SizedBox(width: 4.0),
                      Text(widget.rating, style: AppStyle.medium12),
                      const SizedBox(width: 12.0),
                      SvgPicture.asset('assets/icons/time.svg'),
                      const SizedBox(width: 4.0),
                      Text(widget.time, style: AppStyle.medium12),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: (){
                  isFavorite = !isFavorite;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  isFavorite? 'assets/icons/Favourite-Heart-red.svg' : 'assets/icons/Favourite-Heart.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
