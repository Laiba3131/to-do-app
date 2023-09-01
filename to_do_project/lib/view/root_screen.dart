import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_project/view/home_screen.dart';

import 'profile_screen.dart';

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
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage()
  ];

  var textList=[
   "Profile",
   "Scan",
   "Home",
   "Gift",
   "Settings",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[selectedScreen],

            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height*0.08,
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
                            Text(textList[i], style: TextStyle(color: Colors.blueGrey),),
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