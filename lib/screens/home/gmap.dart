import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/screens/home/components/float_bottom.dart';

import 'components/body.dart';

class GMap extends StatefulWidget {
  static String routeName = "/map_screen";

  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("الرئيسية"),
      body:Body(),
      // body:ProgressHUD(child: Body()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatBottom(),
    );
  }
}
