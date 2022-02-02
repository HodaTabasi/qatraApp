import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Progress;
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/email_input.dart';
import 'package:qatra_app/components/normal_input.dart';
import 'package:qatra_app/components/password_input.dart';
import 'package:qatra_app/components/phone_input.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ForgetPassResponse.dart';
import 'package:qatra_app/models/ResetModel.dart';
import 'package:qatra_app/screens/login/loginbyemail_screen.dart';
import 'package:qatra_app/screens/login/loginbyphone_screen.dart';
import 'package:qatra_app/screens/select_forget_screen/chooser_way.dart';
import 'package:qatra_app/utils/SizeConfig.dart';



class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;

  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());

    String password =
        Provider.of<MainProvider>(context,listen: false).passwordController.text;
    String rePassword =
        Provider.of<MainProvider>(context,listen: false).rePasswordController.text;

    setState(() {
      isLoading = true;
    });

    ForgetPassResponse response;
    ResetModel model;

    if(Provider.of<MainProvider>(context,listen: false).site == BestTutorSite.email){

      model = ResetModel(email: SharedPrefrencesHelper.sharedPrefrencesHelper.getData("email"),
    password: password,passwordConfirmation: rePassword,token: SharedPrefrencesHelper.sharedPrefrencesHelper.getData("resetToken")
    ,type: "email");

    }else if(Provider.of<MainProvider>(context,listen: false).site == BestTutorSite.mobile){
      String code = Provider.of<MainProvider>(context,
          listen: false).smsCode;

      String countryCode = Provider.of<NewUserProvider>(context, listen: false)
          .countryCode;
      model = ResetModel(phone: SharedPrefrencesHelper.sharedPrefrencesHelper.getData("phone"),
          password: password,passwordConfirmation: rePassword,smsVerification: code,
          type: "mobile");

      print(model.toString());
    }
    // final progress = ProgressHUD.of(context);
    response =
    await HttpService.apiHelper.resetPassword(model);

    // progress.show();

    if (response.status) {
      Provider.of<MainProvider>(context,listen: false).passwordController.clear();
      Provider.of<MainProvider>(context,listen: false).rePasswordController.clear();
      // progress.dismiss();

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(
          msg: "تمت العملية بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);

      Get.offAll(() => LoginEmail(), transition: Transition.leftToRight);
    } else {
      // progress.dismiss();
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(
          msg: response.message[0],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Form(
            key: Provider.of<MainProvider>(context).resetFormKey,
            child: Container(
              margin: EdgeInsets.all(16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff0D2784),
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "نسيت كلمة المرور",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(28),
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00DAFD),
                            height: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      PassInput("كلمة المرور الجديدة ",Provider.of<MainProvider>(context).passwordController),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      PassInput("تاكيد كلمة المرور ",Provider.of<MainProvider>(context).rePasswordController),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      BtnLayout("ارسال", () => onPress()),
                      SizedBox(height: getProportionateScreenHeight(5)),
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
