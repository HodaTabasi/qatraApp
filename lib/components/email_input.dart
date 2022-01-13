import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/utils/constant.dart';

import '../utils/NavigationKey.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            "البريد الالكتروني",
            style: TextStyle(
              color: Color(0xff28449C),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        TextFormField(
          controller: Provider.of<MainProvider>(context).emailController,
          textAlign: TextAlign.right,
          validator: (value) {
            if (value.isEmpty) {
              addToastMessage(error: kEmailNullError,type: false);
              return "";
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              addToastMessage(error: kInvalidEmailError,type: false);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: () {
                Get.offAll(() => Login(),
                    transition: Transition.rightToLeft,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 550));
                // NavigationService.navigationService.navigateTo(Login.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "استخدم الهاتف",
                  style: TextStyle(
                      color: Color(0xFF00DAFD),
                      fontWeight: FontWeight.w900,
                      fontSize: 12),
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Image.asset("assets/message.png"),
            ),
            suffixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 0),
            border: UnderlineInputBorder(),
            hintText: 'ادخل البريد الالكتروني',
          ),
        ),
      ],
    );
  }
}
