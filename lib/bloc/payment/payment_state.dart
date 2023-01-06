part of 'payment_bloc.dart';

@immutable
class PaymentState {
  final double total;
  final String currency;
  final bool isSelectedCreditCard;
  final CreditCardModelCustom? creditCard;

  const PaymentState({
    this.total = 115.28,
    this.currency = 'MXN',
    this.isSelectedCreditCard = false,
    this.creditCard
  });

  PaymentState copyWith({
    double? total,
    String? currency,
    bool? isSelectedCreditCard,
    CreditCardModelCustom? creditCard,
  }) =>  PaymentState(
    total             : total ?? this.total,
    currency          : currency ?? this.currency,
    isSelectedCreditCard  : isSelectedCreditCard ?? this.isSelectedCreditCard,
    creditCard        : creditCard ?? this.creditCard,
  );

}
