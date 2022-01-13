import 'package:flutter/material.dart';

class EditTextProfile extends StatelessWidget {
  String title;
  IconData myIcon;
  TextEditingController Controller;
  Function validationText;

  EditTextProfile(this.title, this.myIcon, this.Controller,this.validationText);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
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
        child: TextFormField(
          validator: (value) => validationText(value),
          controller: Controller,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              suffixIcon: Icon(myIcon),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 15, right: 15),
              hintText: '$title'),
        ),
      ),
    );
  }
}
