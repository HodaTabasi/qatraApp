import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/screens/order/order_screen.dart';
import 'package:qatra_app/screens/profile/profile_screen.dart';
import 'package:qatra_app/utils/NavigationKey.dart';

import '../gmap.dart';

class FloatBottom extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.r),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrund.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Provider.of<MainProvider>(context, listen: false).changeValue(0);
              // setState(() {
              //   value = 0;
              // });
              Get.offAll(() => ProfileScreen(),
                  transition: Transition.rightToLeft,
                  curve: Curves.easeInOutCubic,
                  duration: Duration(milliseconds: 550));

            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.r),
              margin: EdgeInsets.only(left: 80.0.r),
              child: Image.asset(
                  Provider.of<MainProvider>(context, listen: false).floatValue == 0 ? "assets/user.png" : "assets/user_unf.png"),
            ),
          ),
          InkWell(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false).changeValue(1);
                // setState(() {
                //
                //   value = 1;
                // });
                Get.offAll(() => OrderScreen(),
                    transition: Transition.rightToLeft,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 550));
                ;
              },
              child: Image.asset(
                  Provider.of<MainProvider>(context, listen: false).floatValue == 1 ? "assets/order_f.png" : "assets/order_imag.png")),
          InkWell(
            onTap: () {
              Provider.of<MainProvider>(context, listen: false).changeValue(2);
              // setState(() {
              //   value = 2;
              // });
              Get.offAll(() => GMap(),
                  transition: Transition.rightToLeft,
                  curve: Curves.easeInOutCubic,
                  duration: Duration(milliseconds: 550));
            },
            child: Container(
                margin: EdgeInsets.only(right: 70.0.r),
                child: Image.asset(Provider.of<MainProvider>(context, listen: false).floatValue == 2
                    ? "assets/home_img.png"
                    : "assets/home_unf.png")),
          ),
        ],
      ),
    );
  }
}
