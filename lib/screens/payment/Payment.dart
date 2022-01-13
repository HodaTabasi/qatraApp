import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

import '../../utils/NavigationKey.dart';
import 'components/body.dart';

class Payment extends StatefulWidget {
  static String routeName = "/payment";

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("تاكيد الدفع") ,
      body: Body(),
      // body: ProgressHUD(child: Body()),
    );
  }
}
