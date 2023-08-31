import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static saveItems(toDoList) async {
    var pref = await SharedPreferences.getInstance();
    var savedList = toDoList.map((item) => item[0].toString()).toList();
    await pref.setStringList('toDoList', savedList);
    print("added");

    //   pref.setString("add", jsonEncode([
    //   //  ["Make Tutorial", false],
    //   //  ["Make Tutorial", false],
    //   items
    // ]));
  }

//   void _saveToDoList() {
//   final List<String> savedList = toDoList.map((item) => item[0].toString()).toList();
//   _prefs.setStringList(_prefsKey, savedList);
// }

  static getItems() async {
    var pref = await SharedPreferences.getInstance();
    var savedList = pref.getStringList('toDoList');
    if (savedList != null) {
      return savedList.map((item) => [item, false]).toList();
    }
    return [];
  }
}




// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesUtil {
//   static late SharedPreferences _prefs; // SharedPreferences instance
//   static final String _prefsKey = 'todoList'; // Key for storing the to-do list data

//   // Initialize SharedPreferences
//   static Future<void> initSharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   // Load the to-do list from SharedPreferences
//   static List<List<dynamic>> loadToDoList() {
//     final List<String>? savedList = _prefs.getStringList(_prefsKey);
//     if (savedList != null) {
//       return savedList.map((item) => [item, false]).toList();
//     }
//     return [];
//   }

//   // Save the to-do list to SharedPreferences
//   static Future<void> saveToDoList(List<List<dynamic>> toDoList) async {
//     final List<String> savedList = toDoList.map((item) => item[0].toString()).toList();
//     await _prefs.setStringList(_prefsKey, savedList);
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:to_do_project/shared_preferences_util.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPreferencesUtil.initSharedPreferences();
//   runApp(MyApp());
// }





// _HomePageState class in home_screen.dart:


// class _HomePageState extends State<HomePage> {
//   List<List<dynamic>> toDoList = SharedPreferencesUtil.loadToDoList();
  
//   // ... Other methods ...

//   void saveNewTask() {
//     setState(() {
//       toDoList.add([_controller.text, false]);
//       _controller.clear();
//       SharedPreferencesUtil.saveToDoList(toDoList);
//     });
//     Navigator.of(context).pop();
//   }

//   void deleteTask(int index) {
//     setState(() {
//       toDoList.removeAt(index);
//       SharedPreferencesUtil.saveToDoList(toDoList);
//     });
//   }

//   // ... Rest of your code ...
// }


