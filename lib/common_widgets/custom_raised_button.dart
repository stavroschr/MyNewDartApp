import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton(
  {required this.text,
    required this.color,
    required this.icon,
  required this.borderRadius,
required this.onPressed, }
  );

final Text text;
  final Color color;
  final Image icon;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,

      icon: icon,
      label: text,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),

    );
  }
}
