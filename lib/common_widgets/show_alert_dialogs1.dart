import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showAlertDialog1(
  BuildContext context, {
    required String title,
required String content,
required String defaultActionText,
      String? cancelActionText,
}
){
  if (!Platform.isIOS){
    return showDialog (

      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions:<Widget> [
          if (cancelActionText !=null)
          FloatingActionButton(child:Text(cancelActionText),onPressed: ()=> Navigator.of(context).pop(false),),


        ],
      ),
    );
  }
  return showCupertinoDialog (

    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions:<Widget> [
        if (cancelActionText !=null)
          CupertinoDialogAction(child:Text(cancelActionText),onPressed: ()=> Navigator.of(context).pop(false),),


      ],
    ),
  );

}