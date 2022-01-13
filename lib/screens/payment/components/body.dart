import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/btn_layout.dart';
import 'package:qatra_app/helper/providers/order_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/screens/payment/components/final_order_item.dart';
import 'package:qatra_app/screens/payment/components/lablel.dart';
import 'package:qatra_app/screens/payment/components/visa_layout.dart';
import 'package:qatra_app/utils/SizeConfig.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qatra_app/components/CustomDialogBox.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/models/Order.dart';
import 'package:qatra_app/models/PaymentResponse.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';
import 'package:qatra_app/utils/constant.dart';

import 'edit_text_layout.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Order order = new Order();

  bool isLoading = false;

  onPress() async {
    FocusScope.of(context).requestFocus(FocusNode());

    Data data =
        Provider.of<MainProvider>(context, listen: false).productDitails;

    order.mosqueType =
        Provider.of<OrderProvider>(context, listen: false).mosqueType;

    order.productId = data.product.id;
    order.mosqueId = data.mosque.id;
    order.mosqueName = data.mosque.name;

    order.receiverName =
        Provider.of<OrderProvider>(context, listen: false).nameController.text;

    order.receiverPhone =
        Provider.of<OrderProvider>(context, listen: false).phoneController.text;

    order.finalPrice = int.parse(data.product.price); //data.product.price;
    order.priceAfterDiscount =
        int.parse(data.product.price); //data.product.price;
    order.priceBeforeDiscount =
        int.parse(data.product.price); //data.product.price;
    order.quantity =
        int.parse(data.product.countCartoons); //data.product.countCartoons;

    // final progress = ProgressHUD.of(context);
    // progress.show();



    String fname = SharedPrefrencesHelper.sharedPrefrencesHelper.getData("fName");
    String lname = SharedPrefrencesHelper.sharedPrefrencesHelper.getData("lName");

    if(fname != null || lname != null){
      setState(() {
        isLoading = true;
      });
      PaymentResponse myjson = await HttpService.apiHelper.sendOrder(order);

      if (myjson.status) {
        // progress.dismiss();
        Provider.of<OrderProvider>(context, listen: false).disposeController();
        setState(() {
          isLoading = false;
        });

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "تمت عمليه الدفع بنجاح",
                // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                // text: "Yes",
              );
            });
      }
      else {
        setState(() {
          isLoading = false;
        });
        addToastMessage(error: myjson.message[0], type: false);
      }
    }else {
      addToastMessage(error: "تاكد من اكمال ملفك الشخصي", type: false);
    }



  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              LableItem("اسم صاحب البطاقة"),
              EditTextLayout("الاسم ثلاثي",
                  Provider.of<OrderProvider>(context).nameInCardController),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              LableItem("اسم البطاقة"),
              VisaLayout(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        LableItem("صالح من خلال البطاقة"),
                        EditTextLayout(
                            "رقم البطاقة",
                            Provider.of<OrderProvider>(context)
                                .cardNumberController),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        LableItem("cvv"),
                        EditTextLayout("رقم الامان",
                            Provider.of<OrderProvider>(context).cvvController),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              FinalOrderItem(),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 70,
                      color: Colors.grey.withOpacity(0.33),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Text(
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .nameController
                                    .text,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ))),
                        Container(
                            margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Text("اسم المستلم",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black12,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Text(
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .phoneController
                                    .text,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ))),
                        Container(
                            margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Text("  رقم الجوال",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black12,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              BtnLayout("تاكيد الدفع", () => onPress())
            ],
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
