import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static saveItems(items) async {
    var pref = await SharedPreferences.getInstance();
    //var savedList = toDoList.map((item) => item[0].toString()).toList();
    await pref.setString('toDoList', jsonEncode(items));
    print("added");
    print(items);

  }

  static getItems() async {
    var pref = await SharedPreferences.getInstance();
    var savedList = pref.getString('toDoList');
    if (savedList != null) {
     jsonDecode(savedList);
    }
    return [];
  }
}




