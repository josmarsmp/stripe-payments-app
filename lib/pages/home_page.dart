import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/data/credit_cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/models/creadit_card_model.dart';
import 'package:stripe_app/pages/credit_card.dart';

import '../widgets/home/delivery_information.dart';
import '../widgets/home/resume_widget.dart';

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
                    viewportFraction: 0.85,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: creditCards.length,
                  itemBuilder: (_, i) {
                    final CreditCardModelCustom creditCard = creditCards[i];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            fadeInNavigation(context, const CreditCardPage()));
                      },
                      child: Hero(
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
            const Resume()
          ],
        ));
  }
}
