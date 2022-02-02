import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/onBoardingProvider.dart';
import 'package:qatra_app/screens/newuser/new_user.dart';
import 'package:qatra_app/screens/onboarding/components/onboared_item.dart';
import 'package:qatra_app/models/item.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';

import '../../../utils/NavigationKey.dart';
import 'indecator_layout.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {



    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                controller: Provider.of<OnBoardProvider>(context, listen: false).pageController,
                onPageChanged: (value) {
                  setState(() {
                    Provider.of<OnBoardProvider>(context, listen: false).activePage = value;
                  });
                },
                children: List.generate(ItemBoard.pageInfos.length, (index) {
                  return onboardItem(ItemBoard.pageInfos[index]);
                }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                if (Provider.of<OnBoardProvider>(context, listen: false).activePage == 2){
                  Get.offAll(() => NewUser(),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 550));
                }

                // NavigationService.navigationService.navigateTo(Login.routeName);
                setState(() {
                  Provider.of<OnBoardProvider>(context, listen: false).pageController.animateToPage(++Provider.of<OnBoardProvider>(context, listen: false).activePage,
                      duration: Duration(milliseconds: 900), curve: Curves.ease);
                  print(Provider.of<OnBoardProvider>(context, listen: false).activePage);
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xFF0D2784),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(13.0))),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(child: IndecatorLayout(Provider.of<OnBoardProvider>(context, listen: false).activePage)),
            Row(
              children: [
                Expanded(child: Container()),
                InkWell(
                  onTap: () {

                    Get.offAll(() => NewUser(),
                        transition: Transition.rightToLeft,
                        curve: Curves.easeInOutCubic,
                        duration: Duration(milliseconds: 550));

                    // NavigationService.navigationService
                    //     .navigateTo(Login.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.fromLTRB(26.0, 0, 26.0, 26.0),
                    child: Text(
                      "تخطي",
                      style: TextStyle(fontSize: 14, color: Color(0xFF0D2784)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
