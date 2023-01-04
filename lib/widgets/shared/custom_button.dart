import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.backgroundColor, required this.text, required this.textColor, required this.onPressed, required this.icon});

  final Color backgroundColor;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        textStyle: TextStyle(color: textColor)),
        onPressed: () => {},
        label: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        icon: icon
      );
  }
}
