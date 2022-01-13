import 'package:flutter/material.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/order_item.dart';
import 'package:qatra_app/screens/confirm_orders/components/deffult_item.dart';
import 'package:qatra_app/screens/confirm_orders/components/select_user.dart';
import 'package:qatra_app/screens/select_card/selectpayment.dart';

import '../../utils/NavigationKey.dart';
import '../../utils/SizeConfig.dart';
import 'components/selected_item.dart';

class ConfirmOrders1 extends StatefulWidget {
  static String routeName = "/confirm_order1";

  @override
  _ConfirmOrders1State createState() => _ConfirmOrders1State();
}

class _ConfirmOrders1State extends State<ConfirmOrders1> {
  // onPress(){
  //   NavigationService.navigationService.navigateTo(SelectCard.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderItem(),
            SizedBox(
              height: getProportionateScreenHeight(8),
            ),
            SelectUser(),
            SizedBox(
              height: getProportionateScreenHeight(8),
            ),
            SelectedItem(title:"مصلى الرجال"),
            SizedBox(
              height: getProportionateScreenHeight(8),
            ),
            DeffultItem("مصلى النساء"),
            Spacer(),
            BtnLayout("تاكيد الطلب",(){
              NavigationService.navigationService.navigateTo(SelectCard.routeName);
            })
          ],
        ),
      ),
    );
  }
}
