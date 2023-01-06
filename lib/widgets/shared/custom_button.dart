import 'package:flutter/material.dart';
import 'package:stripe_app/theme/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, this.backgroundColor = StripeAppConstants.stripeAppPrimaryColor, this.textColor = StripeAppConstants.stripeAppSecondaryColor, this.icon});

  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: textColor),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if( icon != null ) icon!,
            if( icon != null ) const SizedBox( width: 10),
            Text(
              text,
              style: TextStyle(fontSize: 15, color: textColor),
            ),
          ],
        ),
      );
  }
}
