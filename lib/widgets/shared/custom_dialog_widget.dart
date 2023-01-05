import 'package:flutter/material.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/theme/constants.dart';
import 'package:stripe_app/widgets/shared/custom_button.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.icon,
      required this.onButtonPressed,
      this.buttonIcon});

  final Icon icon;
  final String title;
  final String message;
  final Widget? buttonIcon;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: getHeightByPercent(context, 40),
        width: getWidthByPercent(context, 80),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            const SizedBox(height: 20),
            Column(
              children: <Widget>[
                Text(title, style: stripeAppDialogTitleStyle),
                const SizedBox(height: 20),
                Text(message, style: stripeAppDialogMessageStyle)
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: getWidthByPercent(context, 45),
              height: 45,
              child: CustomButton(
                text: 'Ok',
                onPressed: onButtonPressed,
                icon: buttonIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
