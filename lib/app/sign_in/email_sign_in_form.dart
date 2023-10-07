


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_time2/services/auth.dart';

import '../../common_widgets/form_submit_button.dart';
import '../../common_widgets/show_alert_dialogs.dart';

import 'package:provider/provider.dart';


enum EmailSignInFormType {signIn, register}

class EmailSignInForm extends StatefulWidget{




  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {


 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final FocusNode _emailFocusNode = FocusNode();
 final FocusNode _passwordFocusNode = FocusNode();


  EmailSignInFormType _formType = EmailSignInFormType.signIn;
 String get _email => _emailController.text;
 String get _password => _passwordController.text;
bool _submitted = false;
bool _isLoading = false;

@override
void dispose(){
  _emailController.dispose();
  _passwordController.dispose();
  _emailFocusNode.dispose();
  _passwordFocusNode.dispose();
  print('dispose called');
  super.dispose();

}
  void _submit() async {
    print("TO ESTEILE");
    setState(() {
      _submitted = true;
      _isLoading = true;

    });
    print(
        'email:${_emailController.text},password: ${_passwordController.text}');

try {
  //await Future.delayed(Duration(seconds: 3));
  final auth =Provider.of<AuthBase>(context,listen: false);
    if (_formType == EmailSignInFormType.signIn) {
      await auth.signInWithEmailAndPassword(_email, _password);
    }else {
      await auth.createUserWithEmailAndPassword(_email, _password);
    }
    Navigator.of(context).pop();
    } catch(e) {

  print(e.toString());
showAlertDialog(context,
title: 'Sign in failed',
content: e.toString(),
defaultActionText: 'OK',);


} finally {
  setState(() {
    _isLoading = false;
  });
}
  }

  void _emailEditingComplete()
  {
    print('email editing completed');
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }
  void _toggleFormType(){
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn ?
          EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren (){
    final primaryText = _formType == EmailSignInFormType.signIn
         ? 'Sign In'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
    ? 'Need an acoount ? Register'
        : 'Have an account? Sign In';

    bool? _submitEnabled =_email.isNotEmpty && _password.isNotEmpty &&!_isLoading;

    return [
      _buildEmailTextField(),
     SizedBox(height: 8.0),
       _buildPasswordTextField(),
      FormSubmitButton(text: primaryText,
        onPressed:_submitEnabled ? _submit : null,
        child:Text(primaryText),
      ),

      TextButton(
        style: TextButton.styleFrom(
          primary: Colors.redAccent,
          textStyle: const TextStyle(
            fontSize: 13,
          ),
        ),
        onPressed: !_isLoading ? _toggleFormType : null,
        child: Text(secondaryText), ),

    ];
  }

  TextField _buildPasswordTextField() {

    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
      labelText: 'Password',

    ),
       textInputAction: TextInputAction.done,
      obscureText: true,
    onEditingComplete: _submit,
      onChanged:(email)=> _updateState(),

    );
  }

  TextField _buildEmailTextField() {

    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
enabled: _isLoading == false,

      ),
autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
      onChanged: (email)=> _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),),
    );
  }

 void _updateState ( ){

    print('email: $_email, password: $_password');
    setState(() {

    });
  }

  }
