import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_booking_with_doctor/features/payment/data/models/card.dart';
import 'package:online_booking_with_doctor/features/payment/data/repos/get_all_cards_repo.dart';

class GetAllCardsRepoImpl implements GetAllCardsRepo {
  @override
  Future<List<CardModel>> getAllCards() async {
    final response = await http.get(Uri.parse(''));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CardModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }
}
