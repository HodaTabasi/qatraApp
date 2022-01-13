import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

class MainZoom extends StatelessWidget {
  static String routeName = "/main";
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(menuScreen: SideMenuScreen(), mainScreen: GMap());
  }
}
