import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

import '../utils/NavigationKey.dart';

class MyAppBarr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.menu),
          onPressed: () => NavigationService.navigationService
              .navigateTo(SideMenuScreen.routeName)),
      title: Padding(
        padding:  EdgeInsets.all(16.0.r),
        child: Text(
          "map",
          style: TextStyle(color: Colors.white),
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        Navigator.canPop(context)
            ? IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () =>
              NavigationService.navigationService.navigatePop(),
        )
            : IconButton(
          color: Colors.white,
          icon: Icon(Icons.search),
          onPressed: () =>
              NavigationService.navigationService.navigatePop(),
        )
      ],
    );
  }
}
