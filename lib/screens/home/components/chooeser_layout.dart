import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';

import 'btn_layout.dart';

class Choosere extends StatefulWidget {

  @override
  _ChoosereState createState() => _ChoosereState();
}

class _ChoosereState extends State<Choosere> {
  var _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Flexible(
              child: BtnLayout(
                title: "مساجد حد الحرم",
                value: 0,
                groupValue: _value,
                onChanged: (value) => setState(() {
                  _value = value;
                  Provider.of<MainProvider>(context, listen: false).changeMosqueType(value);

                  print("${Provider.of<MainProvider>(context,listen: false).mosqueType} iiiiiiiiii ");
                }),
              )),
          Flexible(
              child: BtnLayout(
                  title: "مساجد مكة",
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) => setState(() {
                    _value = value;
                    Provider.of<MainProvider>(context, listen: false).changeMosqueType(value);

                    print("${Provider.of<MainProvider>(context,listen: false).mosqueType} iiiiiiiiii ");
                  } ))),
        ],
      ),
    );
  }
}
