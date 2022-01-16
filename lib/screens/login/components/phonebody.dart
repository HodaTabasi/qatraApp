import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/newuser_input.dart';
import 'package:qatra_app/components/password_input.dart';
import 'package:qatra_app/components/phone_input.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ForgetPassResponse.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:qatra_app/utils/constant.dart';

class PhoneBody extends StatefulWidget {
  @override
  _PhoneBodyState createState() => _PhoneBodyState();
}

class _PhoneBodyState extends State<PhoneBody> {
  bool isLoading = false;

  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());

    // final progress = ProgressHUD.of(context);

    if (Provider.of<MainProvider>(context, listen: false)
        .phoneformKey
        .currentState
        .validate()) {
      Provider.of<MainProvider>(context, listen: false)
          .phoneformKey
          .currentState
          .save();
      var phone = Provider.of<MainProvider>(context, listen: false)
          .phoneController
          .text;
      var code =
          Provider.of<NewUserProvider>(context, listen: false).countryCode;

      var pass = Provider.of<MainProvider>(context, listen: false)
          .passwordController
          .text;

      // progress.show();
      setState(() {
        isLoading = true;
      });
      Loginjson loginjson =
          await HttpService.apiHelper.login1(code + phone, pass, "phone");

      if (loginjson.status) {
        setState(() {
          isLoading = false;
        });
        SharedPrefrencesHelper.sharedPrefrencesHelper.saveLoginData(
            isLogin: true,
            lname: loginjson.data.user.lastName,
            fname: loginjson.data.user.firstName,
            token: loginjson.data.token.accessToken,
            password: Provider.of<MainProvider>(context, listen: false)
                .passwordController
                .text);

        // SharedPrefrencesHelper.sharedPrefrencesHelper.setData("fName", loginjson.data.user.firstName??"empty");
        // SharedPrefrencesHelper.sharedPrefrencesHelper.setData("lName", loginjson.data.user.lastName??"empty");

        // progress.dismiss();

        Provider.of<MainProvider>(context, listen: false).desposeFun();

        Get.offAll(() => GMap(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInOutCubic,
            duration: Duration(milliseconds: 550));

        // NavigationService.navigationService.navigateTo(GMap.routeName);
      } else {
        // progress.dismiss();
        addToastMessage(error: loginjson.message[0], type: false);

        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: Provider.of<MainProvider>(context).phoneformKey,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 127,
                      height: 70,
                    ),
                    SizedBox(height: (SizeConfig.screenHeight) * 0.08),
                    PhoneInput(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    PassInput("كلمة المرور",
                        Provider.of<MainProvider>(context).passwordController),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    GestureDetector(
                      onTap: () async {
                        Get.offAll(() => ChosserWayReset(),
                            transition: Transition.rightToLeft,
                            curve: Curves.easeInOutCubic,
                            duration: Duration(milliseconds: 550));
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          "هل نسيت كلمة المرور",
                          style: TextStyle(
                            color: Color(0xff28449C),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    BtnLayout("تسجيل دخول", () => onPress()),
                    NewUserInput()
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoading
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: SpinKitPouringHourGlassRefined(
                    color: Color(0xff00DAFD),
                    size: 50.0,
                  ),
                ),
              )
            : Center()
      ],
    );
  }
}
