import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatra_app/screens/newuser/new_user.dart';

import '../utils/NavigationKey.dart';

class NewUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Color(0xffF5F5F7)),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, color: Colors.white))),
          onPressed: () => Get.offAll(() => NewUser(),
              transition: Transition.rightToLeft,
              curve: Curves.easeInOutCubic,
              duration: Duration(milliseconds: 550)),
          // NavigationService.navigationService.navigateTo(NewUser.routeName),
          child: Text(
            "تسجيل جديد",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
