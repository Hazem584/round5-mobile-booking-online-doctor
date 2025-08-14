import 'package:online_booking_with_doctor/features/payment/data/models/card.dart';

abstract class GetAllCardsRepo {
  Future<List<CardModel>> getAllCards();
}