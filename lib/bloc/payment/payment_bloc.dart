import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/credit_card_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<OnSelectCreditCard>(_handleSelectCreditCard);
    on<OnDeselectCreditCard>(_handleDeselectCreditCard);
  }

  void _handleSelectCreditCard(
      OnSelectCreditCard event, Emitter<PaymentState> emit) {
    emit(state.copyWith(
        isSelectedCreditCard: true, creditCard: event.creditCard));
  }

  void _handleDeselectCreditCard(
      OnDeselectCreditCard event, Emitter<PaymentState> emit) {
    emit(state.copyWith(
        isSelectedCreditCard: false));
  }
}
