import 'package:flutter/material.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/utils/constant.dart';
import 'package:qatra_app/screens/select_card/pay_item.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

import '../../utils/NavigationKey.dart';
import '../../utils/SizeConfig.dart';

class SelectCard extends StatefulWidget {
  static String routeName = "/select_card";

  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("تحديد وسيلة الدفع"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/payment.png"),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "اختر طريقة الدفع المفضلة لديك",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff28449C)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                primary: false,
                children: PayIcon.map((e) => PayItem(e)).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
