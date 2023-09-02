import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  bool _notificationsEnabled = true;
  double _fontSize = 16.0;
  

  // Function to update notification settings
  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  // Function to update font size
  void _updateFontSize(double value) {
    setState(() {
      _fontSize = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconButton(
            //     onPressed: () {
            //       pop(context);
            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     )),
            Text("Settings Screen"),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
            SizedBox(height: 16.0),
            Text(
              'Text Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: _updateFontSize,
            ),
            SizedBox(height: 16.0),
            Text(
              'Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // DropdownButton<String>(
            //   value: _selectedTheme,
            //   items: ['Light', 'Dark', 'System'].map((theme) {
            //     return DropdownMenuItem<String>(
            //       value: theme,
            //       child: Text(theme),
            //     );
            //   }).toList(),
            //   onChanged: _updateTheme,
            // ),
          ],
        ),
      ),
    );
  }
}