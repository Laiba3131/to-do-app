import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/dialog_box.dart';
import '../utils/to-do-list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _controller= TextEditingController();
  //List of to do task
  List toDoList=[
     ["Make Tutorial", false],
     ["Make Tutorial", false],
  ];

  // check box was tapped

  void CheckBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= ! toDoList[index][1];
    });
  }

  // create a new task
  void createNewTask()
  {
    showDialog(context: context, builder: (context){
      return DialogBox( addNewTask: _controller, onSave: saveNewTask, onCancel: () => Navigator.of(context).pop(),);
    });
  }

  void saveNewTask()
  {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // void deleteTask(int index)
  // {
  //   setState(() {
  //     toDoList.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text("TO DO"),
      elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
      createNewTask();
      }),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
       return ToDoTile(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value)=> CheckBoxChanged(value, index), 
      // delFunction: (context)=> deleteTask(index),
       );
      }),
      
    );
  }
}