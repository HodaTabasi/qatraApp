// import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/screens/extra/extea.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/screens/newuser/new_user.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/NavigationKey.dart';

class SideMenuScreen extends StatefulWidget {
  static String routeName = "/side_menu";

  @override
  _SideMenuScreenState createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double v = size.height / 5;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/menu.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.menu),
                        onPressed: () =>
                            NavigationService.navigationService.navigatePop(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "الصفحة الرئيسية",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/menu_home.png"),
                        onTap: (){
                          // NavigationService.navigationService
                          //     .navigateToReplacement(GMap.routeName);
                          Get.offAll(() => GMap(),transition: Transition.rightToLeft,
                              curve: Curves.easeInOutCubic,
                              duration: Duration(milliseconds: 550));
                        },
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "البنود والظروف",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/benood.png"),
                        onTap: (){
                          SharedPrefrencesHelper.sharedPrefrencesHelper.setType("services");
                          // NavigationService.navigationService
                          //     .navigateToReplacement(Extra.routeName);
                          Get.to(() => Extra(),transition: Transition.rightToLeft,
                              curve: Curves.easeInOutCubic,
                              duration: Duration(milliseconds: 550));
                        },
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "سياسة الخصوصية",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/policy.png"),
                        onTap: (){
                          SharedPrefrencesHelper.sharedPrefrencesHelper.setType("privacy");
                          // NavigationService.navigationService
                          //     .navigateToReplacement(Extra.routeName);
                          Get.to(() => Extra(),transition: Transition.rightToLeft,
                              curve: Curves.easeInOutCubic,
                              duration: Duration(milliseconds: 550));
                        },
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "عن قطرة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/qatra.png"),
                        onTap: (){
                          SharedPrefrencesHelper.sharedPrefrencesHelper.setType("terms");
                          // NavigationService.navigationService
                          //     .navigateToReplacement(Extra.routeName);
                          Get.to(() => Extra(),transition: Transition.rightToLeft,
                              curve: Curves.easeInOutCubic,
                              duration: Duration(milliseconds: 550));
                        },
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "تطوير مياسم",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Image.asset("assets/mayasem.png"),
                        onTap: () async {
                          const url = "https://flutter.io";
                          if (await canLaunch(url))
                          await launch(url);
                          else
                          // can't launch url, there is some error
                          throw "Could not launch $url";
                          // js.context.callMethod('open', ['https://stackoverflow.com/questions/ask']);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(25.0),
              child: ListTile(
                title: Text(
                  "تسجيل خروج",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Image.asset("assets/logout.png"),
                onTap: () {
                  SharedPrefrencesHelper.sharedPrefrencesHelper.clear();
                  Navigator.of(context)
                      .pushAndRemoveUntil(
                    CupertinoPageRoute(
                        builder: (context) => NewUser()
                    ),
                        (_) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
