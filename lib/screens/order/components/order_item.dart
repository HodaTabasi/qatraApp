import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/models/Order.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';

class MyOrderItem extends StatelessWidget {
  Order data;
  MyOrderItem(this.data);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.46,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${data.mosqueName}",
                style: TextStyle(
                    color: Color(0xff0D2784),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '${data.countCartoons}',
                          style: TextStyle(
                              color: Color(0xff0D2784),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${(20*int.parse(data.countCartoons))}',
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
                            Container(
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
                            Text(
                              '${data.countCartoons}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
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
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
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
                        '${data.finalPrice} ريال ',
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
          ],
        ),
      ),
    );
  }
}
