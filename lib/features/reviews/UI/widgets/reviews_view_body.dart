import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/widgets/app_text_button.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/widgets/review_input-container.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/widgets/review_popup.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({super.key});

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  String reviewText = '';
  final TextEditingController _reviewController = TextEditingController();

  void _showReviewPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ReviewPopup(
          onDone: () {
            // Clear the text when popup is closed
            _reviewController.clear();
            setState(() {
              reviewText = '';
            });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Your Rate", style: TextStyles.font16LightBlackNormal),
        ),
        verticalSpace(25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(Assets.assetsImagesStar, width: 32, height: 32),
              Image.asset(Assets.assetsImagesStar, width: 32, height: 32),
              Image.asset(Assets.assetsImagesStar, width: 32, height: 32),
              Image.asset(Assets.assetsImagesStar, width: 32, height: 32),
              Image.asset(
                Assets.assetsImagesStar,
                width: 32,
                height: 32,
                color: Color(0xFFBBC1C7),
              ),
              const Spacer(),
              Text(
                "4/5",
                style: TextStyles.font30LightBlackNormal,
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Your review", style: TextStyles.font20LightBlackNormal),
        ),
        verticalSpace(10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReviewInputContainer(
            controller: _reviewController,
            hintText: "Write your review",
            onChanged: (value) {
              setState(() {
                reviewText = value;
              });
            },
            onSubmitted: (value) {
              if (kDebugMode) {
                print('Review submitted: $value');
              }
            },
          ),
        ),
        verticalSpace(130),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AppTextButton(
            buttonText: "Send your review",
            textStyle: TextStyles.font16WhiteNormal,
            onPressed: () {
              if (reviewText.isNotEmpty) {
                _showReviewPopup();
              }
            },
          ),
        ),
      ],
    );
  }
}
