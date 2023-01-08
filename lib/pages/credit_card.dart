import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/payment/payment_bloc.dart';

import '../models/credit_card_model.dart';
import '../widgets/home/resume_widget.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final CreditCardModelCustom creditCard =
        context.read<PaymentBloc>().state.creditCard!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout with credit card'),
          leading: IconButton(
            onPressed: () {
              context.read<PaymentBloc>().add(OnDeselectCreditCard());
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: <Widget>[
            Hero(
              tag: creditCard.cardNumber,
              child: CreditCardWidget(
                cardNumber: creditCard.cardNumber,
                expiryDate: creditCard.expiracyDate,
                cardHolderName: creditCard.cardHolderName,
                isHolderNameVisible: true,
                cvvCode: creditCard.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (_) {},
                cardBgColor: Colors.black,
              ),
            ),
            const Spacer(),
            const Resume()
          ],
        ));
  }
}
