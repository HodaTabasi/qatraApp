import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/components/order_item.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/order_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';
import 'package:qatra_app/screens/confirm_orders/components/selected_item.dart';
import 'package:qatra_app/screens/payment/components/edit_text_layout.dart';
import 'package:qatra_app/screens/select_card/selectpayment.dart';
import 'package:qatra_app/utils/NavigationKey.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:qatra_app/utils/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpand = false;
  bool visable = true;
  bool isLoading = false;
  int _value = 1;

  onPress() {
    Provider.of<OrderProvider>(context, listen: false).mosqueType = _value;
    String fname = SharedPrefrencesHelper.sharedPrefrencesHelper.getData("fName");
    String lname = SharedPrefrencesHelper.sharedPrefrencesHelper.getData("lName");

    if(fname != null || lname != null){
      Get.offAll(() => SelectCard(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 550));
    } else {
      addToastMessage(error: "تاكد من اكمال ملفك الشخصي", type: false);
    }
    // NavigationService.navigationService.navigateTo(SelectCard.routeName);
  }

  getData() async {
    int mId = Provider.of<MainProvider>(context, listen: false).mosqueId;

    productDitails productDitailResponse =
        await HttpService.apiHelper.getProductDetails(Provider.of<MainProvider>(context, listen: false).productId, mId);

    if (productDitailResponse.status) {
      Provider.of<MainProvider>(context, listen: false).productDitails =
          productDitailResponse.data;

      Provider.of<OrderProvider>(context, listen: false).quantity =
          int.parse(productDitailResponse.data.product.countCartoons);


    } else {
      addToastMessage(error:productDitailResponse.message[0],type: false);
    }

    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ?
    SingleChildScrollView(
      child: Column(
        children: [
          OrderItem(),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Container(
            margin: isExpand ? EdgeInsets.all(0) : EdgeInsets.all(16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 1000),
                elevation: 0,
                children: [
                  ExpansionPanel(
                      body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            EditTextLayout("اسم المستلم",Provider.of<OrderProvider>(context, listen: false).nameController),
                            SizedBox(
                              height: getProportionateScreenHeight(12),
                            ),
                            EditTextLayout("رقم جوال المستلم",Provider.of<OrderProvider>(context, listen: false).phoneController),
                            SizedBox(
                              height: getProportionateScreenHeight(25),
                            ),
                            Directionality(
                                textDirection: TextDirection.ltr,
                                child: SelectedItem(
                                    title: "مصلى الرجال",
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (value) =>
                                        setState(() => _value = value))),
                            Directionality(
                                textDirection: TextDirection.ltr,
                                child: SelectedItem(
                                    title: "مصلى النساء",
                                    value: 0,
                                    groupValue: _value,
                                    onChanged: (value) =>
                                        setState(() => _value = value))),
                          ],
                        ),
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          alignment: Alignment.centerRight,
                          child: Text("تحديد المستلم"),
                        );
                      },
                      isExpanded: isExpand)
                ],
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    isExpand = !isExpand;
                    visable = !isExpand;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Visibility(
            child: SelectedItem(
                title: "مصلى الرجال",
                value: 1,
                groupValue: _value,
                onChanged: (value) => setState(() => _value = value)),
            visible: visable,
          ),
          Visibility(
            child: SelectedItem(
                title: "مصلى النساء",
                value: 0,
                groupValue: _value,
                onChanged: (value) => setState(() => _value = value)),
            visible: visable,
          ),
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
          BtnLayout("تاكيد الطلب", () => onPress()),
          SizedBox(
            height: getProportionateScreenHeight(26),
          ),
        ],
      ),
    ) :Loading();
  }
}
