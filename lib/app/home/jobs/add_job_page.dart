import 'package:flutter/material.dart';
import 'package:flutter_time2/services/database.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/show_alert_dialogs1.dart';
import '../models/job.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key, required this.database});
final Database database;

  static Future<void> show(BuildContext context)async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddJobPage(database: database,),fullscreenDialog: true),);
  }



  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _ratePerHour;

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      print('form saved name:$_name, rate per hour: $_ratePerHour');
      final job = Job(name: _name, ratePerHour: _ratePerHour);
      await widget.database.createJob(job);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      elevation: 15.0,
      title: Text('New Job'),
      actions: <Widget>[
        FloatingActionButton(
          child: Text(
            'Save', style: TextStyle(fontSize: 18.0, color: Colors.white70),),
          onPressed: _submit,
        ),
      ],
    ),

      body: _buildContents(),
      backgroundColor: Colors.grey,
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }


  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [TextFormField(
      decoration: InputDecoration(
          labelText: 'Job Name'),
      validator: (value) => value!.isNotEmpty ? null : 'Name can\'t be empty',
      onSaved: (value) => _name = value,
    ),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'Rate per hour'),
        keyboardType: TextInputType.numberWithOptions(
            signed: false, decimal: false),
        onSaved: (value) => _ratePerHour = int.tryParse(value!) ?? 0,
      ),

    ];
  }

}