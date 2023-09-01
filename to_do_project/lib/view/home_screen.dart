import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_project/utils/preferences.dart';
import 'package:to_do_project/utils/utils.dart';
import 'package:to_do_project/view/login_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/dialog_box.dart';
import '../utils/to-do-list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isCalendarVisible = false;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  var tabController;
  @override
  void initState() {
    Preferences.saveItems(toDoList);
    _controller = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    initializeSharedPreferences();
    super.initState();
  }

  
Future<void> initializeSharedPreferences() async {
  await Preferences.saveItems(toDoList);
}


  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TextEditingController _controller = TextEditingController();
  List toDoList = [
    ["Make Tutorial 1", false],
    //["Make Tutorial 2", false],
  ];
//   ToDoList = [
//     {"Task": "Make Tutorial", "Completed": False},
//     {"Task": "Write Report", "Completed": False},
// ];

  // check box was tapped

  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            addNewTask: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() async {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
     //await Preferences.saveItems(toDoList);
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      Preferences.saveItems(toDoList);
      //_saveToDoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Text("TO DO"),
             IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            createNewTask();
          }),
      body: Column(
        children: [
          DefaultTabController(
              length: 2,
              child: TabBar(
                controller: tabController,
                labelStyle: TextStyle(fontSize: 15),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blueGrey,
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    text: 'Today',
                  ),
                  Tab(
                    text: 'Month',
                  ),
                ],
              )),
          Container(
            height: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              Tab(
                child: ListView.builder(
                    itemCount: toDoList.length,
                    itemBuilder: (context, index) {
                      return ToDoTile(
                        taskName: toDoList[index][0],
                        taskCompleted: toDoList[index][1],
                        onChanged: (value) => CheckBoxChanged(value, index),
                        deleteFunction: () => deleteTask(index),
                        text:
                            'Selected Date: ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}',
                      );
                    }),
              ),
              Tab(
                  child: Column(children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.symmetric(horizontal:8.0),
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey, width: 2), borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text("Add Date on your task"),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isCalendarVisible = !_isCalendarVisible;
                            });
                          },
                          icon: Icon(
                            _isCalendarVisible
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isCalendarVisible,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2023, 1, 1),
                    lastDay: DateTime.utc(2023, 12, 31),
                    focusedDay: _selectedDay,
                    // focusedDay: _selectedDay,
                    // calendarFormat: _calendarFormat,
                    // onFormatChanged: (format) {
                    //   setState(() {
                    //     _calendarFormat = format;
                    //   }
                    //   );
                    // },
                    // onPageChanged: (focusedDay) {
                    //   _selectedDay = focusedDay;
                    // },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDate = selectedDay;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5),
                Divider(),
                Flexible(
                  child: ListView.builder(
                      itemCount: toDoList.length,
                      itemBuilder: (context, index) {
                        return ToDoTile(
                            taskName: toDoList[index][0],
                            taskCompleted: toDoList[index][1],
                            onChanged: (value) => CheckBoxChanged(value, index),
                            deleteFunction: () => deleteTask(index),
                            text:
                                'Selected Date: ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}');
                      }),
                ),
              ])),
            ]),
          ),
        ],
      ),
    );
  }
}
