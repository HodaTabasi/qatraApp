import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/helper/auth_helper.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/helper/providers/otp_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/screens/home/gmap.dart';

import '../../utils/SizeConfig.dart';
import 'otp_form.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String myCode;
  String smsCode;

  onPress() async {
    myCode = Provider.of<OTPProvider>(context, listen: false).makeCode();
    await FireAuthHelper.fireAuthHelper.handleManualOTP(myCode, context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Provider.of<OTPProvider>(context, listen: false).disposeControler();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
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
                    Text(
                      "ادخل رمز التحقق",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00DAFD),
                        height: 2.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '''
                أدخل الرمز الذي نرسله إلى هاتفك 
                يرجى التحقق منه وتعبئته.
                ''',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff28449C),
                        height: 1.5,
                      ),
                    ),
                    OtpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.1),
                    Text(
                      "لم أتلق الرمز",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        // OTP code resend
                      },
                      child: Text(
                        "أعد إرسال الرمز",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff28449C),
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.023),
                    BtnLayout("استمرار", () => onPress()),
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
