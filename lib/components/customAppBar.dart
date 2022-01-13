import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qatra_app/components/data_search.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';
import 'package:qatra_app/utils/NavigationKey.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title ;


  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.menu),
          onPressed: () => Get.to(() => SideMenuScreen(),
              transition: Transition.rightToLeft,
              curve: Curves.easeInOutCubic,
              duration: Duration(milliseconds: 550))
          // NavigationService.navigationService
          // .navigateTo(SideMenuScreen.routeName)
          ),
      title: Padding(
        padding:  EdgeInsets.all(16.0.r),
        child: Text(
          title,
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
                onPressed: () => showSearch(context: context, delegate: DataSearch()),
              )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
