import 'package:flutter/material.dart';
import 'package:flutter_time2/app/model/task.dart';
import 'package:flutter_time2/app/view/components/shape.dart';
import 'package:flutter_time2/app/view/components/title.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  // final taskList = <Task>[
  //   Task('hello'),
  //   Task('i am stavros chrysos'),
  //   Task('--------'),
  //   Task('-------------'),
  //
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         const _Header(),

         ],
      ),

    floatingActionButton: FloatingActionButton(
    onPressed: (){},

    child: const Icon(Icons.add, size: 50),),
    );
  }




  }

class _NewTaskModal extends StatelessWidget {
    _NewTaskModal({super.key,required this.onTaskCreated});

 final _controller = TextEditingController();
final void Function(Task task) onTaskCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top:Radius.circular(33)),
      color: Colors.orangeAccent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const H1('new record'),
          const SizedBox(height: 26),
           TextField(
             controller: _controller,

            decoration: InputDecoration(
                filled: true,
              fillColor: Colors.deepPurpleAccent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Description'
            ),

            ),

          const SizedBox(height: 26),

          ElevatedButton(onPressed: (){


if(_controller.text.isNotEmpty)
  {
    final task = Task(_controller.text);
    onTaskCreated(task);
        Navigator.of(context).pop();
    _controller.clear();
  }



          }, child: const Text('Add')),


        ],
      ),
    );
  }
}


class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     color: Theme.of(context).colorScheme.primary,
      child: Column(
       children: [
         const Row(children: [
           Shape()]
    ),
         Column(
           children: [
             Image.asset(
               'assets/images/tasks-list-image.png',
           width: 120,
            height: 120,
             ),



      const SizedBox(height: 16),
            const H1('first screen of app', color: Colors.white),
             const SizedBox(height: 16,)
           ],
          ),
        ],

        ),

      );
  }
}





