import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_booking_online_doctor/core/di/dependency_injection.dart';
import 'package:mobile_booking_online_doctor/features/favorite/data/data%20source/favorite_remote_data_source.dart';
import 'package:mobile_booking_online_doctor/features/home/data/models/doctor_model.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorCardItem extends StatefulWidget {
  const DoctorCardItem({
    super.key,
    required this.doctorEntity,

  });
  final DoctorEntity doctorEntity;

  @override
  State<DoctorCardItem> createState() => _DoctorCardItemState();
}

class _DoctorCardItemState extends State<DoctorCardItem> {
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
                widget.doctorEntity.image,
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
                  Text(widget.doctorEntity.name, style: TextStyles.regular14.copyWith(fontFamily: 'Georgia')),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(widget.doctorEntity.specialtyNameEn, overflow: TextOverflow.ellipsis, style: TextStyles.regular12.copyWith(color: ColorsManger.greyColor,),),
                      Text(' | ', style: TextStyles.regular12.copyWith(color: ColorsManger.greyColor,),),
                      Expanded(child: Text(widget.doctorEntity.location,overflow: TextOverflow.ellipsis, style: TextStyles.regular12.copyWith(color: ColorsManger.greyColor, ),)),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/rating.svg'),
                      const SizedBox(width: 4.0),
                      Text(widget.doctorEntity.rating, style: TextStyles.medium12),
                      const SizedBox(width: 12.0),
                      SvgPicture.asset('assets/icons/time.svg'),
                      const SizedBox(width: 4.0),
                      Text(widget.doctorEntity.availableTime, style: TextStyles.medium12),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: (){
                  widget.doctorEntity.isFav =  !widget.doctorEntity.isFav;
                  getIt<FavoriteLocalDataSource>().toggleFavorite(DoctorModel.fromDoctorEntity(widget.doctorEntity));
                  setState(() {});
                },
                child: SvgPicture.asset(
                  widget.doctorEntity.isFav? 'assets/icons/Favourite-Heart-red.svg' : 'assets/icons/Favourite-Heart.svg',
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
