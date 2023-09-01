import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_project/view/login_screen.dart';
import 'package:to_do_project/view/root_screen.dart';

import '../utils/text_field.dart';
import '../utils/utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool show = true;

  toggle() {
    setState(() {
      show = !show;
    });
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create account",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Roboto Regular",
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Sign up to continue",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto Regular",
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    text: "Full Name",
                    lable: "Enter your Full Name",
                    controller: nameController),
                CustomTextField(
                    text: "Email",
                    lable: "Enter your Email ",
                    controller: emailController),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Roboto Regular",
                            decorationColor: Colors.black),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: show,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto Regular",
                              decorationColor: Colors.black),
                          suffix: IconButton(
                            onPressed: () {
                              toggle();
                            },
                            icon: show == true
                                ? Icon(
                                    Icons.visibility_off,
                                  )
                                : Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blueGrey,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        push(context, RootScreen());
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    const Text("ALready have an account?"),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        push(context, LoginScreen());
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
