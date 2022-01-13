import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/screens/login/components/flag_item.dart';
import 'package:qatra_app/screens/login/loginbyemail_screen.dart';
import 'package:qatra_app/utils/constant.dart';

import '../utils/NavigationKey.dart';

class PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            "رقم الجوال",
            style: TextStyle(
              color: Color(0xff28449C),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                addToastMessage(error:kEmailNullError,type: false);
                return "";
              }
              return null;
            },
            controller: Provider.of<MainProvider>(context).phoneController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              prefixIcon: InkWell(
                onTap: () {
                  // print("ggggggggggggggg");
                  Get.offAll(() => LoginEmail(),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 550));
                  // NavigationService.navigationService
                  //     .navigateTo(LoginEmail.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "استخدم الايميل",
                    style: TextStyle(
                        color: Color(0xFF00DAFD),
                        fontWeight: FontWeight.w900,
                        fontSize: 12),
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: CountryCodePicker(
                builder: (CountryCode x) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 25,
                        child: VerticalDivider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(x.flagUri,
                                    package: 'country_code_picker'))),
                      ),
                    ],
                  );
                },
                hideMainText: true,
                onChanged: (value) {
                  // SharedPrefrencesHelper.sharedPrefrencesHelper.setCodeCountry(value.code);
                  Provider.of<NewUserProvider>(context, listen: false)
                      .countryCode = value.dialCode;
                  Provider.of<NewUserProvider>(context, listen: false)
                      .countryName = value.name;
                  print(
                      "hhhhhhhh ${value.code} ${value.dialCode} ${value.name}");
                },

                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                favorite: ['AE', 'SA', 'BH','QA','PS','DZ','EG','IQ','MA','JO','KW','LB','LY','OM','SY','SD','TN','YE'],
                initialSelection: 'SA',
                // optional. Shows only country name and flag
                showFlag: true,
                showCountryOnly: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,

                flagDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                // flagWidth: 30,
              ),
              suffixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 0),
              border: UnderlineInputBorder(),
              hintText: 'ادخل الرقم هنا',
            ),
          ),
        ),
      ],
    );
  }
}
