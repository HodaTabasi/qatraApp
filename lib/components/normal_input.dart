import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/utils/constant.dart';

import '../utils/NavigationKey.dart';

class NormalInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          child: Text("البريد الالكتروني",style: TextStyle(
            color: Color(0xff28449C),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
            textAlign: TextAlign.right,),
        ),
        Container(
          child: TextFormField(
            validator: (value) => emailValidate(value),
            controller: Provider.of<NewUserProvider>(context).emailController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Image.asset("assets/message.png"),
              ),
              suffixIconConstraints:
              BoxConstraints(minWidth: 20, minHeight: 0),
              border: UnderlineInputBorder(
              ),
              hintText: 'ادخل البريد الالكتروني',
            ),
          ),
        ),
      ],
    );
  }
}
