import 'package:flutter/material.dart';

class LableItem extends StatelessWidget {
  String title;


  LableItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Text(
        "$title",
        style: TextStyle(
          color: Color(0xff28449C),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
