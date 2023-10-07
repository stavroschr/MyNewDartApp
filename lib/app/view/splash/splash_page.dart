import 'package:flutter/material.dart';
import 'package:flutter_time2/app/view/components/title.dart';
import 'package:flutter_time2/app/view/task_list/task_list_page.dart';

import '../../../common_widgets/show_alert_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_time2/services/auth.dart';

class SplashPage extends StatelessWidget {

  Future<void> _signOut (BuildContext context)async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signOut();
// onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }
    Future<void> _confirmSignOut(BuildContext context) async {
      final didRequestSignOut = await showAlertDialog(
        context, title: 'Logout',
        content: 'Are you sure that you want to Logout?',
        defaultActionText: 'Logout',
        cancelActionText: 'Cancel',);
      if (didRequestSignOut == true) {
        _signOut(context);
      }
    }

  @override
  Widget build(BuildContext context) {
return  Scaffold(
  appBar: AppBar(
    title: const Text('         Welcome',textAlign: TextAlign.center,style: TextStyle(color: Colors.deepPurple),),
    leading: GestureDetector(onTap:()=>_confirmSignOut(context) ,child: const Center(child: Text('back'),)),
      actions: [
  FloatingActionButton(child: const Text('Logout'),onPressed: ()=>_confirmSignOut(context),

),
  ],
  ),
  body: Column(

    children: [
      const Row(
        children: [

        ],
      ),
const SizedBox(height: 79),
      Image.asset('assets/images/onboarding-image.png',
        width: 141,height: 129,),

      const SizedBox(height: 99),
     H1('My New App',color: Colors.redAccent,),
      const SizedBox(height: 21),
      GestureDetector(
        onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return const TaskListPage();
      }));
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text('Welcome to my new app,the ultimate ai number generator,enjoy,tap to enter',textAlign: TextAlign.center,),
        ),
      ),

    ],
  ),
);  }
  
}