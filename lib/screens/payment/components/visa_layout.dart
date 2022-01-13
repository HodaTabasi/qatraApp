import 'package:flutter/material.dart';

class VisaLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 0, bottom: 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(12,2,12,3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 70,
              color: Colors.grey.withOpacity(0.43),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: '00000000000000000000'),
              ),
            ),
            Image.asset("assets/visa1.png"),
          ],
        ),
      ),
    );
  }
}
