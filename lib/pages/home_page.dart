import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/data/credit_cards.dart';
import 'package:stripe_app/models/creadit_card_model.dart';

import '../widgets/information_label.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                      cvvCode: creaditCard.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (_) {},
                      cardBgColor: Colors.black,
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: size.width * 0.8,
              height: size.height * 0.05,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add new card",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              width: size.width * 0.90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Delivery Information',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700)),
                  const Divider(
                    color: Colors.black54,
                    height: 20.0,
                  ),
                  InformationLabel(
                    icon: FontAwesomeIcons.locationDot,
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "1569 Cordell Rd",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Bowman, Georgia(GA), 30624",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const InformationLabel(
                    icon: FontAwesomeIcons.truck,
                    label: Text(
                          "Wednesday, 12 July 2022 at 3:30 PM",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                  ),
                  const SizedBox(height: 10,),
                  const InformationLabel(
                    icon: FontAwesomeIcons.phone,
                    label: Text(
                          "+12 345 6789",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

