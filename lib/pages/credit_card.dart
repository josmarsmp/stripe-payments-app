import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../models/creadit_card_model.dart';
import '../widgets/home/resume_widget.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final CreditCardModelCustom creditCard = CreditCardModelCustom(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Josmar Salvador'
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout with credit card'),
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
      )
    );
  }
}
