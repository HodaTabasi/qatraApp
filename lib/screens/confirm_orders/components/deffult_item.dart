import 'package:flutter/material.dart';

class DeffultItem extends StatelessWidget {
  String title;

  DeffultItem(this.title);

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
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(child: Image.asset("assets/rigth.png"),opacity: 0,),
          Container(
              margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Text("$title",style: TextStyle(
                fontSize: 16,
                color: Colors.black12,
              ))),
        ],
      ),
    );
  }
}
