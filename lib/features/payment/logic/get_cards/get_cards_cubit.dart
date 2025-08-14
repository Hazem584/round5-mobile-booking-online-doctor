import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/payment/data/models/card.dart';
import 'package:online_booking_with_doctor/features/payment/data/repos/get_all_cards_repo_impl.dart';

part 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  GetCardsCubit() : super(GetCardsInitial());

  Future<List<CardModel>> getAllCards() {
    final cardRepoImpl = GetAllCardsRepoImpl();
    final cards = cardRepoImpl.getAllCards();
    return cards;
  }
}
