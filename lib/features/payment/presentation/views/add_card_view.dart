import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_button.dart';
import 'package:online_booking_with_doctor/features/payment/logic/get_cards/get_cards_cubit.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/widgets/card_view_body.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/widgets/empty_card_view_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<GetCardsCubit, GetCardsState>(
        builder: (context, state) {
          if (state is GetCardsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCardsSuccess) {
            return CardViewBody();
          } else if (state is GetCardsFailure) {
            return const EmptyCardViewBody();
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(text: "+ Add card"),
      ),
    );
  }
}
