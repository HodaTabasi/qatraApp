import 'package:flutter/material.dart';
import 'components/phonebody.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // onPress(){
  //   print("object");
  //   NavigationService.navigationService.navigateTo(GMap.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: PhoneBody());
        // body: ProgressHUD(child: PhoneBody()));
  }
}
