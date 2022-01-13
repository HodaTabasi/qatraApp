import 'package:flutter/material.dart';


class FinalOrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(8.0),
                    child: Opacity(
                      child: Text(
                        "data",
                        style: TextStyle(fontSize: 20),
                      ),
                      opacity: 0.0,
                    ),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    '60',
                    style: TextStyle(
                        color: Color(0xff0D2784),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '12000 ريال',
                    style: TextStyle(
                        color: Color(0xff00DAFD),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "مسجد الفيروز",
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
                  "مصلى رجال",
                  style: TextStyle(
                      color: Color(0xff0D2784),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
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
