import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import 'custom_pay_button_widget.dart';

class Resume extends StatelessWidget {
  const Resume({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: getWidthByPercent(context, 100),
      height: getHeightByPercent(context, 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
    );
  }
}
