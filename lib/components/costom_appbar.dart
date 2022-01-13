import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qatra_app/utils/NavigationKey.dart';
import 'package:qatra_app/screens/side_menu/side_menu_screen.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.r),
            child: AppBar(
              leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.menu),
                onPressed: () => NavigationService.navigationService.navigateTo(SideMenuScreen.routeName),
              ),
              title: Center(

                child: Text("title",style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.search),
                  onPressed: () => null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}