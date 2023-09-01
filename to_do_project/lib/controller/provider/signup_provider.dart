import 'package:flutter/cupertino.dart';
import '../../model/signup_model.dart';
import '../../utils/utils.dart';
import '../services/api_manager.dart';

class SignupProvider extends ChangeNotifier{
  bool isLoading = false;

  signup1(context, {name1, email1, password1})
  async {
    if(name1.isEmpty)
    {
      showSnackBar(context, Text("Please! Enter your name"));
    }
    else if(email1.isEmpty)
    {
      showSnackBar(context, Text("Please! Enter your email"));
    }
    else if(password1.isEmpty)
    {
      showSnackBar(context, Text("Please! Enter your password "));
    }
    else{
      isLoading=true;
      notifyListeners();
     SignUpModel res= await ApiManager.signup(context, name1, email1, password1);

     if(res!= null)
     {
     // pushUntil(context, HomeScreen());
      isLoading=false;
      notifyListeners();
     }

    }

  }
}