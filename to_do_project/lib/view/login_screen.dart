import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator.adaptive(),)
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Roboto Regular",
                            decorationColor: Colors.black),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Sign in to continue",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto Regular",
                            decorationColor: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      feild("Email", "Enter your Email here", emailController),
                      feild("Password", "Enter your password here",
                          passwordController,
                          isObsecure: true),
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
                            color: Colors.green,
                          ),
                          child: TextButton(
                            onPressed: () async {
                             // push(context, SearchJobScreen());

                              // FocusScope.of(context).unfocus();
                              // if (emailController.text.isEmpty) {
                              //   showSnack(context, "Please, Enter Email");
                              // } else if (passwordController.text.isEmpty) {
                              //   showSnack(context, "Please, Enter Password");
                              // } else {
                              //   setState(() {
                              //     isLoading = true;
                              //   });
                              //   var res = await ApiManager.empolyeeLogin(
                              //       context,
                              //       emailController.text,
                              //       passwordController.text);
                              //   setState(() {
                              //     isLoading = false;
                              //   });
                              //   if (res["code"] == "200") {
                              //                                 push(context, SearchJobScreen());

                              //   }
                              // }
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}



Widget feild(var text, var lable, controller, {var isObsecure = false}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              fontFamily: "Roboto Regular",
              decorationColor: Colors.black),
        ),
        TextField(
          controller: controller,
          obscureText: isObsecure,
          decoration: InputDecoration(
              hintText: lable,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto Regular",
                  decorationColor: Colors.black)),
        ),
        SizedBox(
          height: 30,
        )
      ],
    ),
  );
}
