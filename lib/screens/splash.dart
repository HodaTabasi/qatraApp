import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/utils/NavigationKey.dart';
import 'package:qatra_app/screens/onboarding/introduction_screen.dart';

import '../utils/SizeConfig.dart';

class Splash extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController animation;

  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    HttpService.apiHelper.initUniLinks();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.8).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bool isLoadong =
            SharedPrefrencesHelper.sharedPrefrencesHelper.getLogin();
        isLoadong != null
            ? isLoadong
                ? Get.offAll(() => GMap(),
                    transition: Transition.rightToLeft,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 550))
                : Get.offAll(() => IntroScreen(),
                    transition: Transition.rightToLeft,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 550))
            : Get.offAll(() => IntroScreen(),
                transition: Transition.rightToLeft,
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 550));
        // animation.reverse();
      }
      // else if(status == AnimationStatus.dismissed){
      //   animation.forward();
      // }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Image.asset(
              "assets/logo1.png",
              width: 200,
              height: 200,
            ),
          ),
        ));
  }

  @override
  dispose() {
    // you need this
    animation.dispose();
    super.dispose();
  }
}
