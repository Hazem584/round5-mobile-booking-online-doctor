import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_booking_with_doctor/features/payment/data/repos/add_card_reop_impl.dart';


part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardReopImpl _addCardReopImpl;
  AddCardCubit(this._addCardReopImpl) : super(AddCardInitial());
  void addCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  }) {
    _addCardReopImpl.addCard(cardNumber, cardHolderName, expiryDate, cvv);

    emit(AddCardLoading());

    Future.delayed(Duration(seconds: 2), () {
      emit(AddCardSuccess());
    });
  }

  void addCardFailure(String error) {
    emit(AddCardFailure(error));
  }

  void save() {
    emit(AddCardSuccess());
  }
}
