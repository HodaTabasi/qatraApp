import 'package:flutter/material.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/profile/profile_screen.dart';
import 'package:qatra_app/utils/NavigationKey.dart';

class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,0,0, 16),
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
              NavigationService.navigationService
                  .navigateTo(ProfileScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.only(left: 80.0),
              child: Image.asset("assets/user.png"),
            ),
          ),
          Image.asset("assets/order_imag.png"),
          InkWell(
            onTap: () {
              NavigationService.navigationService.navigateTo(GMap.routeName);
            },
            child: Container(
                margin: const EdgeInsets.only(right: 70.0),
                child: Image.asset("assets/home_img.png")),
          ),
        ],
      ),
    );
  }
}
