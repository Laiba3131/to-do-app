// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_project/view/home_screen.dart';
// import 'package:to_do_project/view/root_screen.dart';
// import 'package:to_do_project/view/signup_screen.dart';
// import '../controller/provider/login_provider.dart';
// import '../utils/text_field.dart';
// import '../utils/utils.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool show = true;

//   toggle() {
//     setState(() {
//       show = !show;
//     });
//   }

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Builder(builder: (context) {
//           var myProvider = context.watch<LoginProvider>();
//           return myProvider.isLoading
//               ? Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Welcome back",
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w800,
//                               fontFamily: "Roboto Regular",
//                               color: Colors.blueGrey),
//                         ),
//                         SizedBox(
//                           height: 7,
//                         ),
//                         Text(
//                           "Sign in to continue",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Roboto Regular",
//                               color: Colors.black),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         CustomTextField(
//                             text: "Email",
//                             lable: "Enter your Email here",
//                             controller: emailController),
//                         Container(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Password",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w800,
//                                     fontFamily: "Roboto Regular",
//                                     decorationColor: Colors.black),
//                               ),
//                               TextField(
//                                 controller: passwordController,
//                                 obscureText: show,
//                                 decoration: InputDecoration(
//                                   hintText: "Enter Password",
//                                   hintStyle: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                       fontFamily: "Roboto Regular",
//                                       decorationColor: Colors.black),
//                                   suffix: IconButton(
//                                     onPressed: () {
//                                       toggle();
//                                     },
//                                     icon: show == true
//                                         ? Icon(
//                                             Icons.visibility_off,
//                                           )
//                                         : Icon(Icons.visibility),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               )
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "Forgot Password",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 25.0, horizontal: 15),
//                           child: Container(
//                             height: 45,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(7),
//                               color: Colors.blueGrey,
//                             ),
//                             child: TextButton(
//                               onPressed: () async {
//                                 push(context, RootScreen());
//                               },
//                               child: Text(
//                                 "Log In",
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Text("Don't have any account?"),
//                             TextButton(
//                               child: const Text(
//                                 'Sign up',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.blueGrey,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 var provider = context.read<LoginProvider>();
//                                 provider.login1(context,
//                                     email1: emailController.text,
//                                     password1: passwordController.text);
//                                 //push(context, SignUpScreen());
//                               },
//                             )
//                           ],
//                           mainAxisAlignment: MainAxisAlignment.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//         }),
//       ),
//     );
//   }
// }
