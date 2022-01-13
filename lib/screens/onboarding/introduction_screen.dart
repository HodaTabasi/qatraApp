import 'package:flutter/material.dart';

import 'components/body.dart';

class IntroScreen extends StatefulWidget {
  static String routeName = "/introduction";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: Body(),
      ),
    );
  }
}
