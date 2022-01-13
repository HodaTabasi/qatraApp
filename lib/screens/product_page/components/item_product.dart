import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/order_provider.dart';
import 'package:qatra_app/models/Product.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';
import 'package:qatra_app/screens/confirm_orders/ConfirmOrders.dart';
import 'package:qatra_app/screens/confirm_orders/ConfirmOrders1.dart';
import 'package:qatra_app/screens/select_card/selectpayment.dart';

import '../../../utils/NavigationKey.dart';
import '../../../utils/constant.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key key,
      this.image,
      this.title,
      this.country,
      this.price,
      this.press,
      this.product})
      : super(key: key);

  final String image, title, country;
  final Product product;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        Provider.of<MainProvider>(context, listen: false).productId =
            product.id;

        Get.to(() => ConfirmOrders(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInOutCubic,
            duration: Duration(milliseconds: 550));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 50,
          //     color: kPrimaryColor.withOpacity(0.23),
          //   ),
          // ],
        ),
        margin: EdgeInsets.only(
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 5,
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.23),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(image),
              height: 107,
              width: 147,
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${product.countCartoons}',
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "عدد الكراتين",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${product.discount}',
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "عدد الزجاج",
                        style: TextStyle(
                            color: Color(0xff0D2784),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.fromLTRB(3.0, 5.0, 3.0, 0.0),
                    child: Text(
                      '${product.price} ريال ',
                      style: TextStyle(
                          color: Color(0xff00DAFD),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
