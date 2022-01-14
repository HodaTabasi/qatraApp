import 'package:flutter/material.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';

class MainProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneformKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool isLoading = false;

  int mosqueId = 0;
  Data productDitails;
  int productId = 0;

  int mosqueType = 0;
  int floatValue = 2;

  BestTutorSite site;
  bool isReset = false;
  String smsCode ;

  changeIsLoading(value){
    isLoading = value;
    notifyListeners();
  }
  changeMosqueType(value) {
    mosqueType = value;
    notifyListeners();
  }

  changeValue(value) {
    print("ggggggggg $value");
    floatValue = value;
    notifyListeners();
  }

  desposeFun(){
   passwordController.clear();
   emailController.clear();
   rePasswordController.clear();
   phoneController.clear();
  }
}
