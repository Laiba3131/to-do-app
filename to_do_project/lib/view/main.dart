import 'package:flutter/material.dart';
import 'package:to_do_project/view/login_screen.dart';

import '../controller/provider/login_provider.dart';
import '../controller/provider/signup_provider.dart';
import 'home_screen.dart';
import 'root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider()),
          ChangeNotifierProvider(create: (context) => SignupProvider()),
        ],
        child: MaterialApp(
          title: 'To-Do App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          //home:  HomePage(),
          //home: LoginScreen(),
          home: RootScreen(),
        ));
  }
}
