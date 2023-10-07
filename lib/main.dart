import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time2/app/landing_page.dart';

import 'package:provider/provider.dart';

 import 'app/sign_in/sign_in_page.dart';
import 'services/auth.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); //root widget
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
  const primary = Color(0xFF4050B7);
  const textColor = Color(0xFF4A4A4A);
  const backgroundColor = Color(0xFFDBBCE7);
  const introColor = Color(0xFF010C06);

    return Provider<AuthBase>(
      create: (context)=> Auth(),
      child: MaterialApp(
        title: 'hello',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: textColor,
            displayColor: textColor,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
           elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(minimumSize: const Size(
              22,54,
             ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32),
              ),
               textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,
             fontWeight: FontWeight.w700),

             ),
          //
           ),
          useMaterial3: true,
        ),
        home: LandingPage(


        ),
      ),
    );
  }
}

