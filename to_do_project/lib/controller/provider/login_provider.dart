import 'package:flutter/cupertino.dart';
import 'package:to_do_project/view/home_screen.dart';

import '../../model/login_model.dart';
import '../../utils/utils.dart';
import '../services/api_manager.dart';

class LoginProvider extends ChangeNotifier{
 
bool isLoading = false;

login1(context, {email1, password1})async{

  if(email1.isEmpty)
                      {
                        showSnackBar(context, Text("Please! Enter Email address"));
                      }
                      else if(password1.isEmpty){
                      showSnackBar(context, Text("Please! Enter password"));
                      } else {
                       
                      
  isLoading= true;

  notifyListeners();
  //var res = await ApiManager.login(context, email1, password1);
   LoginModel res = await ApiManager.login(context, email1, password1);
  // if ( res["data"] != null )
  if ( res.data != null )
  {
    //await Preference.saveToken(res.data!.accessToken);
   pushUntil(context, HomePage());
    isLoading= false;
   notifyListeners();
 
  }
   
} }

}