import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged onChanged;

  SelectedItem({this.title, this.value, this.groupValue, this.onChanged});


  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return  GestureDetector(
      onTap: (){
        onChanged(value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ?Color(0xff00DAFD):Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 70,
              color: Colors.grey.withOpacity(0.23),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(child: Image.asset("assets/rigth.png") ,visible: isSelected,),
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: Text("$title",style: TextStyle(
                  color: isSelected ?Colors.white :Colors.black12,
                  fontSize: 16
                ),)),

          ],
        ),
      ),
    );
  }
}
