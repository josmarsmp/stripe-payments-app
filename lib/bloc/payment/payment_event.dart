part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class OnSelectCreditCard extends PaymentEvent {
  final CreditCardModelCustom creditCard;

  OnSelectCreditCard(this.creditCard);
}

class OnDeselectCreditCard extends PaymentEvent {}