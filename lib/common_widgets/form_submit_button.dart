import 'package:flutter/material.dart';

import 'customRaized2.dart';

class FormSubmitButton extends CustomRaized2 {
  FormSubmitButton({
    required final String text,
    required onPressed,
    required child,

  })
      :
       super(

  child: Text(
  text,style: TextStyle(color: Colors.orangeAccent, fontSize: 20.0),
  ),
  onPressed: onPressed,
  );
}