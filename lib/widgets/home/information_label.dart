import 'package:flutter/material.dart';

class InformationLabel extends StatelessWidget {
  const InformationLabel({
    Key? key, required this.icon, required this.label,
  }) : super(key: key);

  final IconData icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Icon(icon, color: Colors.white, size: 15,),
        ),
        const SizedBox(width: 10),
        label,
      ],
    );
  }
}