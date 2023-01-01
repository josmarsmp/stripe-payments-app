import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/data/credit_cards.dart';
import 'package:stripe_app/models/creadit_card_model.dart';

import '../widgets/delivery_information.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double buttonHeight = size.height * 0.05;
    final double buttonWidth = size.width * 0.8;

    return Scaffold(
        appBar: AppBar(title: const Text('Payment Method'), actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bell,
                size: 20.0,
              ))
        ]),
        body: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.25,
              child: PageView.builder(
                  controller: PageController(
                    viewportFraction: 0.90,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: creditCards.length,
                  itemBuilder: (_, i) {
                    final CreditCardModelCustom creaditCard = creditCards[i];
                    return CreditCardWidget(
                      cardNumber: creaditCard.cardNumber,
                      expiryDate: creaditCard.expiracyDate,
                      cardHolderName: creaditCard.cardHolderName,
                      isHolderNameVisible: true,
                      cvvCode: creaditCard.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (_) {},
                      cardBgColor: Colors.black,
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(0),
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withAlpha(10))),
                  onPressed: () => {},
                  label: const Text(
                    'Add new Card',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 15,
                  )),
            ),
            const DeliveryInformation(),
            const Spacer(),
            Container(
              width: size.width,
              height: size.height * 0.15,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
                      ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Total: 3 items',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '\$115.28',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      )
                    ],
                  ),
                  const BtnPay()
                ],
              ),
            )
          ],
        ));
  }
}

class BtnPay extends StatelessWidget {
  const BtnPay({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.5,
      child: TextButton.icon(
          onPressed: () => {},
          icon: Icon(
            Platform.isIOS 
            ? FontAwesomeIcons.apple
            : FontAwesomeIcons.google
          ),
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(color: Colors.black)
          ),
          label: const Text('Pay now')),
    );
  }
}
