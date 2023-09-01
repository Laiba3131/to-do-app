
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../model/login_model.dart';
import '../../model/signup_model.dart';
import '../../utils/utils.dart';
import '../provider/login_provider.dart';
import '../provider/signup_provider.dart';
import 'endpoints.dart';

class ApiManager {
  // static function ko direct class name sy call kr sakty hain
  static login(BuildContext context, String email, String password) async {
    try {
      var url = Uri.parse(Base_url + login_endpoint);
      var response =
          await http.post(url, body: {"email": email, "password": password});

      var res = jsonDecode(response.body);
      showSnackBar(context, res["message"]);
     var login_model = LoginModel.fromJson(res); 
     if(login_model!= null)
      return login_model;
    else
    {
      showSnackBar(context, "This variable is null");
    }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  static signup(
      BuildContext context, String name, String email, String password) async {
    try {
      var url = Uri.parse(Base_url + signup_endpoint);
      var response = await http.post(url,
          body: {"name": name, "email": email, "password": password});

      var res = jsonDecode(response.body);
      showSnackBar(context, res["message"]);
      var signup_model = SignUpModel.fromJson(res); 
      return signup_model;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}