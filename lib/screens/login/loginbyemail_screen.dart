import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:qatra_app/screens/login/components/emailbody.dart';


class LoginEmail extends StatefulWidget {
  static String routeName = "/login_email";

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  // onPress(){
  //   NavigationService.navigationService.navigateTo(GMap.routeName);
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: EmailBody());
        // body: ProgressHUD(child: EmailBody()));
  }
}
