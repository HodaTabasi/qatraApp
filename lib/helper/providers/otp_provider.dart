import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final num3Controller = TextEditingController();
  final num4Controller = TextEditingController();
  final num5Controller = TextEditingController();
  final num6Controller = TextEditingController();
  String myCode = "";

  String makeCode() {
    var num1 = num1Controller.text;
    var num2 = num2Controller.text;
    var num3 = num3Controller.text;
    var num4 = num4Controller.text;
    var num5 = num5Controller.text;
    var num6 = num6Controller.text;

    return num1 + num2 + num3 + num4 + num5 + num6;
  }

  disposeControler(){
    num1Controller.clear();
    num2Controller.clear();
    num3Controller.clear();
    num4Controller.clear();
    num5Controller.clear();
    num6Controller.clear();
  }
}
