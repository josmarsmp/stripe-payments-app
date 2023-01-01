import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnPay extends StatelessWidget {
  const BtnPay({super.key});

  @override
  Widget build(BuildContext context) {
    return true
        ? buildCreditCardPayButton(context)
        : buildAppleAndGooglePayButton(context);
  }

  Widget buildCreditCardPayButton(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.5,
      child: TextButton.icon(
          onPressed: () => {},
          icon: const Icon(FontAwesomeIcons.creditCard),
          style: TextButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(color: Colors.black)),
          label: const Text('Pay now')),
    );
  }

  Widget buildAppleAndGooglePayButton(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.5,
      child: TextButton.icon(
          onPressed: () => {},
          icon: Icon(Platform.isIOS
              ? FontAwesomeIcons.apple
              : FontAwesomeIcons.google),
          style: TextButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(color: Colors.black)),
          label: const Text('Pay now')),
    );
  }
}