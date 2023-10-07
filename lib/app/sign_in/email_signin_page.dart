import 'package:flutter/material.dart';
import 'package:flutter_time2/app/sign_in/email_sign_in_form.dart';


class EmailSignInPage extends StatelessWidget {


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 10.0,
        shadowColor: Colors.redAccent,

      ),
  
      body:  SingleChildScrollView(child: EmailSignInForm(),),
      backgroundColor: Colors.white54,
    );
  }


}
