import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/screens/home/gmap.dart';

import '../../../utils/NavigationKey.dart';

class BtnLayout extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged onChanged;

  BtnLayout({this.title, this.value, this.groupValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: isSelected
                    ? MaterialStateProperty.all(Color(0xff28449C))
                    : MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, color: Colors.white))),
            onPressed: () {

              // NavigationService.navigationService.navigateTo(GMap.routeName);
                onChanged(value);
              // showDialog(context: context,
              //     builder: (BuildContext context){
              //       return CustomDialogBox(
              //         title: "Custom Dialog Demo",
              //         // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
              //         // text: "Yes",
              //       );
              //     }
              // );
            },
            child: Text(
              "$title",
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Color(0xff28449C),
                  fontWeight: FontWeight.w700 ),
            ),
          ),
        ),
      ),
    );
  }
}
