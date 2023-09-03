import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_project/view/home_screen.dart';
import 'package:to_do_project/view/rating_screen.dart';
import 'package:to_do_project/view/scan_screen.dart';

import 'profile_screen.dart';
import 'settings_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {


   int selectedScreen = 2;
  var iconsList = [
    Icons.person,
    Icons.scanner,
    Icons.home,
    Icons.star,
    Icons.settings
  ];

  
  var screensList = [
    ProfileScreen(),
    ScanScreen(),
    HomePage(),
    AppRatingScreen(),
    SettingsScreen(),
  ];

  var textList=[
   "Profile",
   "Scan",
   "Home",
   "Rating",
   "Settings",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[selectedScreen],

            bottomNavigationBar: Container(
              height: 70,
        color: Color.fromARGB(255, 235, 239, 232),
         padding: EdgeInsets.symmetric(vertical: 8),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              for (int i = 0; i < iconsList.length; i++)
                
                InkWell(
                  onTap: (() {
                    setState(() {
                      selectedScreen=i;
                    });
                  }),
                   child: selectedScreen == i
                    ? Container(
                        color: Colors.transparent,
                        // margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              iconsList[i],
                              size: 35,
                              color: Colors.blueGrey,
                            ),
                            Text(textList[i], style: TextStyle(color: Colors.blueGrey,fontFamily: "Poppins-Bold"),),
                          ],
                        ),
                      )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                            iconsList[i],
                            size: 20,
                            color: Colors.blueGrey[200],
                          ),
                        Text(textList[i]),
                      ],
                    )
                )
         ]),
      ),

    );
  }
}