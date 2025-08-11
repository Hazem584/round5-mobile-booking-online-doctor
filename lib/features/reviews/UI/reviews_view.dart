import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/reviews/UI/widgets/reviews_view_body.dart';

import '../../../core/theming/styles.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});
  static const routeName = '/reviews';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Reviews', style: TextStyles.font24LightBlackNormal),
        ),
      ),
      body: ReviewsViewBody(),
    );
  }
}
