
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/constants.dart';
import 'information_label.dart';

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      width: size.width * 0.90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Delivery Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
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
                  style: StripeAppConstants.stripeAppLabelStyle
                ),
                Text(
                  "Bowman, Georgia(GA), 30624",
                  style: StripeAppConstants.stripeAppLabelStyle
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const InformationLabel(
            icon: FontAwesomeIcons.truck,
            label: Text(
              "Wednesday, 12 July 2022 at 3:30 PM",
              style: StripeAppConstants.stripeAppLabelStyle
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const InformationLabel(
            icon: FontAwesomeIcons.phone,
            label: Text(
              "+12 345 6789",
              style: StripeAppConstants.stripeAppLabelStyle
            ),
          ),
        ],
      ),
    );
  }
}
