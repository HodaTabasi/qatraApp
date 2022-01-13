import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/customAppBar.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("الملف الشخصي"),
      body: ProgressHUD(
        child: Body(),
      ),
    );
  }
}


/*
AppBar(
            leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.menu),
                onPressed: () => NavigationService.navigationService
                    .navigateTo(SideMenuScreen.routeName)),
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "الملف الشخصي",
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
          ),
* */
