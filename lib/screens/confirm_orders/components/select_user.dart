import 'package:flutter/material.dart';

class SelectUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 70,
            color: Colors.grey.withOpacity(0.33),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_drop_down_sharp),
          Text("تحديد المستلم"),

        ],
      ),
    );
  }
}
