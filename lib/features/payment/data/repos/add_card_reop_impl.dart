import 'package:online_booking_with_doctor/features/payment/data/repos/add_card_repo.dart';

class AddCardReopImpl {
  final AddCardRepo _addCardRepo;

  AddCardReopImpl(this._addCardRepo);

  Future<void> addCard(String cardNumber, String cardHolderName, String expiryDate, String cvv) {
    return _addCardRepo.addCard(cardNumber, cardHolderName, expiryDate, cvv);
  }
}