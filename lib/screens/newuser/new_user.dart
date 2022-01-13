import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'components/body.dart';

class NewUser extends StatefulWidget {
  static String routeName = "/new_user";

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  // onPress(){
  //   NavigationService.navigationService.navigateTo(GMap.routeName);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: Body());
        // body: ProgressHUD(child: Body()));
  }
}
