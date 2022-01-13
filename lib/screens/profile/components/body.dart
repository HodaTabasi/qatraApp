import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/CustomDialogBox.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/profile_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ProfileResponse.dart';
import 'package:qatra_app/models/User.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/screens/profile/components/edit_text.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:qatra_app/utils/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ProfileResponse response;
  bool isLoading = false;
  bool isLoadingUpdate = false;

  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());

    User user = Provider.of<ProfileProvider>(context, listen: false).user;

    // final progress = ProgressHUD.of(context);
    // progress.show();

    user.firstName = Provider.of<ProfileProvider>(context, listen: false)
        .firstNameController
        .text;
    user.lastName = Provider.of<ProfileProvider>(context, listen: false)
        .lastNameController
        .text;
    user.email = Provider.of<ProfileProvider>(context, listen: false)
        .emailController
        .text;
    user.password = Provider.of<ProfileProvider>(context, listen: false)
        .passwordController
        .text;
    user.phone = Provider.of<ProfileProvider>(context, listen: false)
        .phoneController
        .text;
    user.gender = Provider.of<ProfileProvider>(context, listen: false).gender;

    setState(() {
      isLoadingUpdate = true;
    });
    Loginjson loginjson = await HttpService.apiHelper.updateProfile(user);

    if (loginjson.status) {
      SharedPrefrencesHelper.sharedPrefrencesHelper.setData("fName", user.firstName);
      SharedPrefrencesHelper.sharedPrefrencesHelper.setData("lName", user.lastName);

      SharedPrefrencesHelper.sharedPrefrencesHelper.setPassword(user.password);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "تم تحديث بياناتك بنجاح",
              // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
              // text: "Yes",
            );
          });

      Provider.of<ProfileProvider>(context, listen: false).disposeController();

      setState(() {
        isLoadingUpdate = false;
      });

      // progress.dismiss();
    } else {
      // progress.dismiss();
      addToastMessage(error: loginjson.message[0], type: false);

      setState(() {
        isLoadingUpdate = false;
      });
    }
  }

  getData() async {
    // final progress = ProgressHUD.of(context);
    // progress.show();

    response = await HttpService.apiHelper.getMyProfile();
    setState(() {
      isLoading = true;
      Provider.of<ProfileProvider>(context, listen: false).user = response.data;
      if (response.status) {
        Provider.of<ProfileProvider>(context, listen: false)
            .firstNameController
            .text = response.data.firstName;
        Provider.of<ProfileProvider>(context, listen: false)
            .lastNameController
            .text = response.data.lastName;
        Provider.of<ProfileProvider>(context, listen: false)
            .emailController
            .text = response.data.email;
        Provider.of<ProfileProvider>(context, listen: false)
            .passwordController
            .text = SharedPrefrencesHelper.sharedPrefrencesHelper.getPassword();
        Provider.of<ProfileProvider>(context, listen: false)
            .phoneController
            .text = response.data.phone;

        // progress.dismiss();
      }else{
        isLoading = false;
        addToastMessage(error: response.message[0],type: false);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Stack(
            children: [
              Container(
                child: Form(
                  child: Center(
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        EditTextProfile(
                            "الاسم الاول",
                            Icons.person,
                            Provider.of<ProfileProvider>(context)
                                .firstNameController,
                            textValidate),
                        SizedBox(
                          height: getProportionateScreenHeight(20.h),
                        ),
                        EditTextProfile(
                            "اسم العائلة",
                            Icons.person,
                            Provider.of<ProfileProvider>(context)
                                .lastNameController,
                            textValidate),
                        SizedBox(
                          height: getProportionateScreenHeight(20.h),
                        ),
                        EditTextProfile(
                            "البريد الالكتروني",
                            Icons.email,
                            Provider.of<ProfileProvider>(context)
                                .emailController,
                            emailValidate),
                        SizedBox(
                          height: getProportionateScreenHeight(20.h),
                        ),
                        EditTextProfile(
                            "كلمة المرور",
                            Icons.lock,
                            Provider.of<ProfileProvider>(context)
                                .passwordController,
                            passValidate),
                        SizedBox(
                          height: getProportionateScreenHeight(20.h),
                        ),
                        EditTextProfile(
                            "رقم الهاتف",
                            Icons.phone_android,
                            Provider.of<ProfileProvider>(context)
                                .phoneController,
                            () => textValidate),
                        SizedBox(
                          height: getProportionateScreenHeight(20.h),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 70,
                                color: Colors.grey.withOpacity(0.43),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.fifteen_mp),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,),
                                items: gender.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(color: Colors.black),),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if(value == "ذكر"){
                                    Provider.of<ProfileProvider>(context, listen: false)
                                        .gender = "male";
                                  }else if(value == "انثى"){
                                    Provider.of<ProfileProvider>(context, listen: false)
                                        .gender = "female";
                                  }
                                  print("fffff $value");
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(100.h),
                        ),
                        BtnLayout("تحديث", () => onPress())
                      ],
                    )),
                  ),
                ),
              ),
              isLoadingUpdate
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
          )
        : Loading();
  }
}
