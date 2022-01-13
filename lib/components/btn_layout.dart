import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/otp/otp_screen.dart';
import 'package:qatra_app/screens/product_page/product_screen.dart';

import '../utils/NavigationKey.dart';
import 'CustomDialogBox.dart';

class BtnLayout extends StatelessWidget {
  String title;
  Function prsee;

  BtnLayout(this.title,this.prsee);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0.r),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff28449C)),
                padding: MaterialStateProperty.all(EdgeInsets.all(10.r)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16.sp,color: Colors.white))),
            onPressed: prsee,
            child: Text("$title",style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w700),),

          ),
        ),
      ),
    );
  }

  // (){
  // NavigationService.navigationService.navigateTo(GMap.routeName);
  // // showDialog(context: context,
  // //     builder: (BuildContext context){
  // //       return CustomDialogBox(
  // //         title: "Custom Dialog Demo",
  // //         // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
  // //         // text: "Yes",
  // //       );
  // //     }
  // // );
  // },


}
