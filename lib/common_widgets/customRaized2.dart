import 'package:flutter/material.dart';

class CustomRaized2 extends StatelessWidget {
  CustomRaized2({
   required this.child,
    required this.onPressed,

  });

   Widget child;
 VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );



  }
}