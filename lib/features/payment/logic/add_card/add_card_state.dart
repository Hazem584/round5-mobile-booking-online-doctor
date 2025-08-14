part of 'add_card_cubit.dart';

@immutable
abstract class AddCardState {}

class AddCardInitial extends AddCardState {}
class AddCardLoading extends AddCardState {}
class AddCardSuccess extends AddCardState {}
class AddCardFailure extends AddCardState {
  final String error;

  AddCardFailure(this.error);
}


