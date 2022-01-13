import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/normal_input.dart';
import 'package:qatra_app/helper/auth_helper.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ForgetPassResponse.dart';
import 'package:qatra_app/screens/newuser/components/phone_input.dart';
import 'package:qatra_app/utils/SizeConfig.dart';

enum BestTutorSite { email, mobile }

class ChosserWayReset extends StatefulWidget {
  static String routeName = "/Chosser_way_reset";

  @override
  _ChosserWayResetState createState() => _ChosserWayResetState();
}

class _ChosserWayResetState extends State<ChosserWayReset> {
  BestTutorSite _site = BestTutorSite.email;

  bool isLoading = false;

  onPress() {
    switch (_site) {
      case BestTutorSite.email:
        emailVerification();
        break;
      case BestTutorSite.mobile:
        phoneVerification();
        break;
    }
  }

  phoneVerification() async {
    String phone = Provider.of<NewUserProvider>(context, listen: false)
        .phoneController
        .text;
    String countryCode = Provider.of<NewUserProvider>(context, listen: false)
        .countryCode;

    SharedPrefrencesHelper.sharedPrefrencesHelper.setData("phone",countryCode+phone);

    Provider.of<MainProvider>(context,
        listen: false).isReset = true;

    Provider.of<NewUserProvider>(context, listen: false).changeLoading(true);

    String code =
        Provider.of<NewUserProvider>(context, listen: false).countryCode;

    await FireAuthHelper.fireAuthHelper.verifyPhoneNumber(code + phone, context);
  }

  emailVerification() async {
    // progress.show();
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(true);

    String email = Provider.of<NewUserProvider>(context, listen: false)
        .emailController
        .text;

    ForgetPassResponse response =
        await HttpService.apiHelper.forgetPassword(email);

    if (response.status) {
      // progress.dismiss();
      Fluttertoast.showToast(
          msg: response.message.first,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);

        Provider.of<NewUserProvider>(context, listen: false)
            .changeLoading(false);
    } else {
      // progress.dismiss();
      Fluttertoast.showToast(
          msg: response.message.first,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      setState(() {
        Provider.of<NewUserProvider>(context, listen: false)
            .changeLoading(false);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                          "اختيار طريقة التاكيد",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
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
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text('استخدم الايميل',
                              style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.right),
                          trailing: Radio(
                            value: BestTutorSite.email,
                            groupValue: _site,
                            onChanged: (BestTutorSite value) {
                              setState(() {
                                _site = value;
                                Provider.of<MainProvider>(context,
                                        listen: false)
                                    .site = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'استخدم رقم الجوال',
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.right,
                          ),
                          trailing: Radio(
                            value: BestTutorSite.mobile,
                            groupValue: _site,
                            onChanged: (BestTutorSite value) {
                              setState(() {
                                _site = value;
                                Provider.of<MainProvider>(context,
                                        listen: false)
                                    .site = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (SizeConfig.screenHeight) * 0.08),
                  Visibility(
                    child: NormalInput(),
                    visible: _site == BestTutorSite.email,
                  ),
                  Visibility(
                    child: InputPhone(),
                    visible: _site == BestTutorSite.mobile,
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  BtnLayout("استعادة كلمة المرور", () => onPress()),
                ],
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
    ));
  }
}
