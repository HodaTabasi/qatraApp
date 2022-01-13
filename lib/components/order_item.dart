import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/order_provider.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';

import '../utils/constant.dart';

class OrderItem extends StatefulWidget {
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    Data data =
        Provider.of<MainProvider>(context, listen: false).productDitails;

    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.4,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Opacity(
                      child: Text(
                        "data",
                        style: TextStyle(fontSize: 20),
                      ),
                      opacity: 0.0,
                    ),
                  ),
                  Text(
                    '${Provider.of<OrderProvider>(context).quantity}',
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${(20 * Provider.of<OrderProvider>(context).quantity)}',
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(
                              Provider.of<OrderProvider>(context, listen: false)
                                  .quantity);
                          Provider.of<OrderProvider>(context, listen: false)
                              .increment();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff0D2784),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 17,
                          ),
                        ),
                      ),
                      Text(
                        '${Provider.of<OrderProvider>(context).quantity}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Provider.of<OrderProvider>(context).quantity >
                              int.parse(data.product.minPurchase)) {
                            Provider.of<OrderProvider>(context, listen: false)
                                .decrement();
                          } else {
                            addToastMessage(error:  "لا يمكن ان تختار اقل من هذه الكمية",type: false);

                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff0D2784),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${data.mosque.name}",
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "عدد الكراتين",
                  style: TextStyle(
                      color: Color(0xff0D2784),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "عدد الزجاج",
                  style: TextStyle(
                      color: Color(0xff0D2784),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${data.product.price} ريال ',
                  style: TextStyle(
                      color: Color(0xff00DAFD),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
            Center(
              child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/product.png",
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
