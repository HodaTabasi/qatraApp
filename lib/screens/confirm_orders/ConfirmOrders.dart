import 'package:flutter/material.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/screens/confirm_orders/components/body.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

import '../../utils/NavigationKey.dart';


class ConfirmOrders extends StatefulWidget {
  static String routeName = "/confirm_order";

  @override
  _ConfirmOrdersState createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
/*
AppBar(
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () => NavigationService.navigationService
                .navigateTo(SideMenuScreen.routeName)),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "تاكيد الطلب",
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
      )
*/

  // onPress(){
  //   NavigationService.navigationService.navigateTo(SelectCard.routeName);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("تاكيد الطلب"),
      body: Body(),
    );
  }
}
