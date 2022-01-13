import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/screens/order/components/bottombar.dart';

import 'components/body.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("الطلبات"),
      bottomNavigationBar: BottomBar(),
      body: Body(),
      // ProgressHUD(child: Body()),
    );
  }
}

/*
* AppBar(
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () => NavigationService.navigationService
                .navigateTo(SideMenuScreen.routeName)),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "الطلبات",
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Navigator.canPop(context)
              ? IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () =>
                NavigationService.navigationService.navigatePop(),
          )
              : IconButton(
            color: Colors.white,
            icon: Icon(Icons.search),
            onPressed: () =>
                NavigationService.navigationService.navigatePop(),
          )
        ],
      ),
* */
