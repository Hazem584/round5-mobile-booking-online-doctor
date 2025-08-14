part of 'get_cards_cubit.dart';

@immutable
abstract class GetCardsState {}

class GetCardsInitial extends GetCardsState {}

class GetCardsLoading extends GetCardsState {

}

class GetCardsSuccess extends GetCardsState {}

class GetCardsFailure extends GetCardsState {
  final String error;

  GetCardsFailure(this.error);
}
