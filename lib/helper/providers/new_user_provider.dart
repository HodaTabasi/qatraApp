import 'package:flutter/material.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';

class NewUserProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  String countryCode = "+966";
  String smsCode = "";
  String countryName = "العربية السعودية";
  String verificationId ;

  bool isLoading = false;


  changeLoading(value){
    isLoading = value;
    print("is : $isLoading , v : $value ");
    notifyListeners();
  }

  disposeController(){
   passwordController.clear();
   phoneController.clear();
   emailController.clear();
   rePasswordController.clear();
  }

}