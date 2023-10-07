


import 'package:flutter/material.dart';
import 'package:flutter_time2/app/sign_in/email_signin_page.dart';
import 'package:flutter_time2/app/view/splash/splash_page.dart';

import 'package:flutter_time2/common_widgets/show_exception_alert_dialog.dart';

import 'package:flutter_time2/services/auth.dart';
import '../../common_widgets/custom_raised_button.dart';


import 'package:provider/provider.dart';


class SignInPage extends StatefulWidget {




  @override
  State<SignInPage> createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {
  void _showSignInError(BuildContext context, Exception exception)
  {
    showExceptionAlertDialog(
      context,
      title: 'Sign In Failed',
      exception: exception,);

  }

  bool _isLoading = false;

// final void Function(User) onSignIn;
  Future<void> _signInAnonymously(BuildContext context)async {

    try {
setState(() => _isLoading =true);
      final auth = Provider.of<AuthBase>(context,listen: false);
     await auth.signInAnonymously();

     // print('${user?.uid}');
     //  onSignIn(user!);
    }on Exception catch (e) {
     _showSignInError(context,e);
      print(e.toString());
    } finally {
      setState(() => _isLoading =false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context)async {

    try {
      setState(() => _isLoading =true);
      final auth =Provider.of<AuthBase>(context,listen: false);
      await auth.signInWithGoogle();

      // print('${user?.uid}');
      //  onSignIn(user!);
    }on Exception catch (e) {
      _showSignInError(context,e);
      print(e.toString());
    }finally {
      setState(() => _isLoading =false);
    }
  }

  void _signInWithEmail(BuildContext context)
  {

    Navigator.of(context).push(
    MaterialPageRoute<void>(
        fullscreenDialog: true,

    builder: (context) => EmailSignInPage(),
  ),
    );
  }

  Future<void> _signInWithFacebook(BuildContext context)async {

    try {
      setState(() => _isLoading =true);
      final auth =Provider.of<AuthBase>(context,listen: false);
      await auth.signInWithFacebook();

      // print('${user?.uid}');
      //  onSignIn(user!);
    }on Exception catch (e) {
      _showSignInError(context,e);
      print(e.toString());
    } finally {
      setState(() => _isLoading =false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('                          Welcome',textAlign: TextAlign.center,),
        elevation: 10.0,
        shadowColor: Colors.red,
        backgroundColor: Colors.black87,

      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),


            const SizedBox(height: 2.0),
          Image.asset('images/Glow.jpg',height: 200.0,width: 180.0,),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // Opacity(
              //     opacity: 0.5,
              //     child: Image.asset('images/google-logo.png')),

              CustomRaisedButton(
                text: Text("Sign in with Google    "),
                       color: Colors.white24,
                icon: Image.asset('images/google-logo.png'),
              borderRadius: 6.0,
                onPressed:()=> _signInWithGoogle(context),
              ),
            ],
          ),
          SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRaisedButton(
                text: Text("Sign in with Facebook"),
              color: Colors.indigoAccent,
                icon: Image.asset('images/facebook-logo.png'),
                borderRadius: 8.0,
                onPressed:()=> _signInWithFacebook(context),
              ),
              // Opacity(
              //     opacity: 0.1,
              //     child: Image.asset('images/facebook-logo.png')),
            ],
          ),
          SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // Opacity(
              //     opacity: 0.5,
              //     child: Image.asset('images/email-logo.png')),

              CustomRaisedButton(

                text: Text("Sign in with email       "),
                color: Colors.teal,
                icon: Image.asset('images/email-logo.png'),
                borderRadius: 8.0,
                onPressed:()=> _signInWithEmail(context),
              ),
            ],
          ),
          SizedBox(height: 12.0,),
          const Text('or',style: TextStyle(fontSize: 14.0,color: Colors.greenAccent ),
          textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRaisedButton(
                text: Text("Sign in anonymously "),
                color: Colors.deepOrangeAccent,
                icon: Image.asset('images/s-logo.png'),
                borderRadius: 6.0,
                onPressed:()=> _signInAnonymously(context),
              ),
              // Opacity(
              //     opacity: 0.1,
              //     child: Image.asset('images/s-logo.png')),
            ],
          ),
        ],
      ),
     );
  }

  Widget _buildHeader(){
if (_isLoading)
  {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
return Text('Sign in',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600,fontFamily:
  'Sedgwick Ave Display'),);

  }
}


