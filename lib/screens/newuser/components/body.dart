import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/normal_input.dart';
import 'package:qatra_app/components/password_input.dart';
import 'package:qatra_app/helper/auth_helper.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/screens/newuser/components/phone_input.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:qatra_app/utils/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  onPress()  async {
    // final progress = ProgressHUD.of(context);
    String phone = Provider.of<NewUserProvider>(context, listen: false)
        .phoneController
        .text;
    String code =
        Provider.of<NewUserProvider>(context, listen: false).countryCode;

    // progress.show();
    Provider.of<NewUserProvider>(context, listen: false).changeLoading(true);


    bool isRegister = await FireAuthHelper.fireAuthHelper.getFromRealTime(code + phone);

    if(!isRegister) {
      await FireAuthHelper.fireAuthHelper
          .verifyPhoneNumber(code+phone, context);
    }  else {
      // progress.dismiss();
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);

      addToastMessage(error:"هذا الرقم موجود سابقا" ,type: false);
    }

    // NavigationService.navigationService.navigateTo(OtpScreen.routeName);
    // NavigationService.navigationService.navigateTo(GMap.routeName);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "مستخدم جديد",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(28),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff00DAFD),
                                  height: 2.0,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            )),
                        // GestureDetector(
                        //   onTap: () => Get.back(),
                        //   child: Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: Color(0xff0D2784),
                        //     size: 24,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 127,
                        height: 70,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    InputPhone(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    NormalInput(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    PassInput("كلمة المرور",
                        Provider.of<NewUserProvider>(context).passwordController),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    PassInput("تاكيد كلمة المرور",
                        Provider.of<NewUserProvider>(context).rePasswordController),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Login(),
                            transition: Transition.leftToRight,
                            duration: Duration(milliseconds: 900));
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          "لديك حساب مسبقا؟ اضغط هنا. ",
                          style: TextStyle(
                            color: Color(0xff28449C),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    BtnLayout("تسجيل جديد", () => onPress()),
                    SizedBox(height: getProportionateScreenHeight(5)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Provider.of<NewUserProvider>(context, listen: false).isLoading
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
