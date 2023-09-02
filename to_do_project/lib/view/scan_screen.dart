import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen>  with SingleTickerProviderStateMixin{

  var tabController1;

  @override
  void initState() {
    tabController1 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      tabController1.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  Text(
                    "QR code",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
                ],
              ),
              DefaultTabController(
                  length: 2,
                  child: TabBar(
                    controller: tabController1,
                    labelStyle: TextStyle(fontSize: 15,fontFamily: "Poppins-Bold"),
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.green,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        text: 'My code',
                      ),
                      Tab(
                        text: 'Scan code',
                      ),
                    ],
                  )),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: TabBarView(controller: tabController1, children: [
                  Tab(
                    child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFffffff),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ))
                          ]),
                          child: Column(
                            children: [
                              Container(
                                height: 220,
                                 color: Colors.blueGrey,
                                child: Center(child: Center(child: Icon(Icons.star, size: 100,color: Colors.blueGrey[200],)),),
                              ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 30),
                                 child: Center(child: Text("Scan to earn stars", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                               ),
                               Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB9a-tAgYLKoV_rcfwFbLB1zr5_jRfvJaGMPUxqkRyYQ&s"),),
                            ],
                          ),
                          
                         
                    )),
                    
                  ),
                  Tab(
                    child: Container(),
                  ),
                ]),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}