import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatra_app/screens/web_view/WebViewPage.dart';
import 'package:qatra_app/utils/NavigationKey.dart';
import 'package:qatra_app/screens/payment/Payment.dart';

import '../../utils/constant.dart';

class PayItem extends StatelessWidget {
  String image;

  PayItem(this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Get.offAll(() => WebViewPage(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInOutCubic,
            duration: Duration(milliseconds: 550));
        // NavigationService.navigationService.navigateTo(Payment.routeName);

      },
      child: Container(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          margin: EdgeInsets.all(8),
          child: Container(
            margin: EdgeInsets.all(8),
              child: Image.asset(image)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          )),
    );
  }
}
