import 'package:flutter/material.dart';
import 'package:qatra_app/models/item.dart';

class onboardItem extends StatelessWidget {
  ItemBoard item;

  onboardItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              item.image,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0D2784)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              item.body,
              style: TextStyle(fontSize: 20, color: Color(0xFF707070)),
            ),
          )
        ],
      ),
    );
  }
}
