import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/email_input.dart';
import 'package:qatra_app/components/newuser_input.dart';
import 'package:qatra_app/components/password_input.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:qatra_app/utils/constant.dart';

class EmailBody extends StatefulWidget {
  @override
  _EmailBodyState createState() => _EmailBodyState();
}

class _EmailBodyState extends State<EmailBody> {
  var progress;

  bool isLoading = false;

  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (Provider.of<MainProvider>(context, listen: false)
        .formKey
        .currentState
        .validate()) {
      Provider.of<MainProvider>(context, listen: false)
          .formKey
          .currentState
          .save();
      var email = Provider.of<MainProvider>(context, listen: false)
          .emailController
          .text;
      var pass = Provider.of<MainProvider>(context, listen: false)
          .passwordController
          .text;

      // progress.show();
      setState(() {
        isLoading = true;
      });
      Loginjson loginjson =
          await HttpService.apiHelper.login(email, pass, "email");

      if (loginjson.status) {
        SharedPrefrencesHelper.sharedPrefrencesHelper.saveLoginData(
            isLogin: true,
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
        addToastMessage(error:loginjson.message[0] ,type: false );
        setState(() {
          isLoading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // progress = ProgressHUD.of(context);
    return Stack(
      children: [
        Form(
          key: Provider.of<MainProvider>(context).formKey,
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
                    EmailInput(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    PassInput("كلمة المرور",
                        Provider.of<MainProvider>(context).passwordController),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    GestureDetector(
                      onTap: () async {
                        Get.offAll(() => ChosserWayReset(),
                            transition:Transition.rightToLeft,
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
