import 'package:flutter/material.dart';
import 'package:flutter_time2/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_time2/app/sign_in/validators.dart';
import 'package:flutter_time2/app/home/jobs/jobs_page.dart';
import 'package:flutter_time2/app/view/splash/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_time2/services/auth_provider.dart';

import '../services/auth.dart';
import '../services/database.dart';

class LandingPage extends StatelessWidget {



 // @override
 //  void initState() {
 //    super.initState();
 //    // widget.auth.authStateChanges().listen((user){
 //    //   print('uid: ${user?.uid}');});
 //
 //    _updateUser(widget.auth.currentUser); //update user state when app starts
 //  }
 //
 // void _updateUser(User? user){
 // //  print('User id: $user?.uid}');
 //   setState(() {
 //     _user = user;
 //   });
 // }

 @override
 Widget build(BuildContext context) {
   final auth =Provider.of<AuthBase>(context,listen: false);
   return StreamBuilder<User?>(
     stream: auth.authStateChanges(),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.active) {
         final User? user = snapshot.data;
         if (user == null) {
           return SignInPage();
         }
         return Provider<Database>(
         create: (_)=> FirestoreDatabase(uid: user.uid),child: SplashPage());
       }
       return Scaffold(
         body: Center(
           child: CircularProgressIndicator(),
         ),
       );
     },
   );
 }
}