import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/payment/payment_bloc.dart';
import 'package:stripe_app/data/credit_cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/models/credit_card_model.dart';
import 'package:stripe_app/pages/credit_card.dart';
import 'package:stripe_app/widgets/shared/custom_button.dart';

import '../theme/constants.dart';
import '../widgets/home/delivery_information.dart';
import '../widgets/home/resume_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);

    final double buttonHeight = getHeightByPercent(context, 5);
    final double buttonWidth = getWidthByPercent(context, 80);

    return Scaffold(
        appBar: AppBar(title: const Text('Payment Method'),
        actions: <Widget>[
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
              width: getWidthByPercent(context, 100),
              height: getHeightByPercent(context, 25),
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
                        paymentBloc.add(OnSelectCreditCard(creditCard));
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
                          cardBgColor: StripeAppConstants.stripeAppPrimaryColor,
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
              child: CustomButton(
                text: 'Add new Card',
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  color: StripeAppConstants.stripeAppSecondaryColor,
                  size: 15,
                ),
                onPressed: () => showCustomDialog(
                    context: context,
                    icon: const Icon(
                      FontAwesomeIcons.faceSmile,
                      size: 40,
                    ),
                    title: 'Todo correcto',
                    message: 'Tarjeta agregada correctamente',
                    onButtonPressed: () => Navigator.of(context).pop()),
              ),
            ),
            const DeliveryInformation(),
            const Spacer(),
            const Resume()
          ],
        ));
  }
}
