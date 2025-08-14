import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_app_bar.dart';
import 'package:online_booking_with_doctor/features/payment/data/models/card.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/widgets/card_type.dart';
import 'package:online_booking_with_doctor/features/payment/logic/get_cards/get_cards_cubit.dart';


class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Payment Method"),
        verticalSpace(30),
        BlocBuilder<GetCardsCubit, GetCardsState>(
          builder: (context, state) {
            if (state is GetCardsLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetCardsLoading) {
              return FutureBuilder<List<CardModel>>(
                future: context.read<GetCardsCubit>().getAllCards(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Failed to load cards');
                  } else if (snapshot.hasData) {
                    final cards = snapshot.data!;
                    return Column(
                      children: cards
                          .map(
                            (card) => CardType(
                              text: card.cardHolderName,
                              leftSvg: "assets/svgs/.svg",
                              rightIcon: Icon(
                                Icons.circle_outlined,
                                color: AppColors.darkGray,
                                size: 20.sp,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            } else if (state is GetCardsFailure) {
              return Text('Failed to load cards');
            }
            return const SizedBox.shrink();
          },
        ),
        verticalSpace(30),
      ],
    );
  }
}
