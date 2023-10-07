
import 'package:flutter_time2/app/home/jobs/add_job_page.dart';

import '../../../services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time2/common_widgets/show_alert_dialogs.dart';
import 'package:flutter_time2/common_widgets/show_alert_dialogs1.dart';

import 'package:flutter_time2/services/auth.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';


class JobsPage extends StatelessWidget {

  Future<void> _signOut (BuildContext context)async {

    try
   {   final auth =Provider.of<AuthBase>(context,listen: false);

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
    if (didRequestSignOut == true)
      {
        _signOut(context);
      }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: [
          FloatingActionButton(child: Text('Logout'),onPressed: ()=>_confirmSignOut(context),

          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: ()=>_confirmSignOut(context),
            child: const Text('hello'),
          ),
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=> AddJobPage.show(context), //anonymous syntax function to call
      ),
    );
  }

 Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context,listen: false);
    return StreamBuilder<List<Job?>>(
      stream: database.jobsStream(),
        builder: (context, snapshot){
      if (snapshot.hasData){
        final jobs = snapshot.data!;
        final children = jobs.map((job) => Text(job!.name!)).toList();
        return ListView(children: children);
      }

      if (snapshot.hasError){
        return Center(child: Text('some error occured'),);
      }
      return Center(child: CircularProgressIndicator());
 },
      );

 }


}
