import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/utils/constant.dart';

class PassInput extends StatelessWidget {
  String title;
  TextEditingController myController;

  PassInput(this.title,this.myController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xff28449C),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          child: TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                addToastMessage(error: kPassNullError ,type: false);
                return "";
              } else if (value.length < 8) {
                addToastMessage(error: kShortPassError,type: false);
                return "";
              }
              return null;
            },
            controller: myController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Image.asset("assets/pass.png"),
              ),
              suffixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 0),
              border: UnderlineInputBorder(),
              hintText: 'ادخل كلمة المرور هنا',
            ),
          ),
        ),
      ],
    );
  }
}
