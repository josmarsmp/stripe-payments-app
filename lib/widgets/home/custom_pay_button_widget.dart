import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/payment/payment_bloc.dart';
import 'package:stripe_app/theme/constants.dart';
import 'package:stripe_app/widgets/shared/custom_button.dart';

import '../../helpers/helpers.dart';

class BtnPay extends StatelessWidget {
  const BtnPay({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return paymentBloc.state.isSelectedCreditCard
        ? buildCreditCardPayButton(context)
        : buildAppleAndGooglePayButton(context);
  }

  Widget buildCreditCardPayButton(BuildContext context) {
    return SizedBox(
      width: getWidthByPercent(context, 50),
      child: CustomButton(
          backgroundColor: StripeAppConstants.stripeAppSecondaryColor,
          text: 'Pay now',
          textColor: StripeAppConstants.stripeAppPrimaryColor,
          onPressed: () => {},
          icon: const Icon(FontAwesomeIcons.creditCard)),
    );
  }

  Widget buildAppleAndGooglePayButton(BuildContext context) {
    return SizedBox(
      width: getWidthByPercent(context, 50),
      child: CustomButton(
          backgroundColor: StripeAppConstants.stripeAppSecondaryColor,
          text: 'Pay now',
          textColor: StripeAppConstants.stripeAppPrimaryColor,
          onPressed: () => {},
          icon: Icon(Platform.isIOS
              ? FontAwesomeIcons.apple
              : FontAwesomeIcons.google)),
    );
  }
}
