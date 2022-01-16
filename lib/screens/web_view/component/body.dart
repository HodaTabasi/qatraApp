import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/CustomDialogBox.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/order_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/Order.dart';
import 'package:qatra_app/models/PaymentResponse.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/order/order_screen.dart';
import 'package:qatra_app/utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:qatra_app/models/productDitailsResponse.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  WebViewController _controller;
  Order order = new Order();
  Data data;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prepareData();
  }

  void prepareData() {
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
    print(order.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl:
              'https://portal.qatrahksa.com/payment?amount=${order.finalPrice}&key=hgZsGwliF3X7lHtVxeKQhvQlmpcjV66V&description=${order.toString()}',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          // javascriptChannels: <JavascriptChannel>{
          //   _toasterJavascriptChannel(context),
          // },
          // navigationDelegate: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     print('blocking navigation to $request}');
          //     return NavigationDecision.prevent;
          //   }
          //   print('allowing navigation to $request');
          //   return NavigationDecision.navigate;
          // },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            print('Page finished loading: $url');
            if (url.startsWith("https://portal.qatrahksa.com/payment-thanks")) {
              var uri = Uri.parse(url);
              print("ggggggggg ${uri.queryParameters}");
              if (uri.queryParameters['message'] == "Succeeded!") {

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

                  Future.delayed(const Duration(milliseconds: 200), () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            title: "تمت عمليه الدفع بنجاح",
                            // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                            // text: "Yes",
                          );
                        });
                  });
                  Get.offAll(() => OrderScreen(),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 550));
                } else {
                  setState(() {
                    isLoading = false;
                  });
                  addToastMessage(error: myjson.message[0], type: false);
                }


              }else{
                addToastMessage(error: uri.queryParameters['message'], type: false);
                Get.offAll(() => GMap(),
                    transition: Transition.rightToLeft,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 550));
              }
            }
            // else {
            //
            //   addToastMessage(error: "فشل في الارسال", type: false);
            // }
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
          debuggingEnabled: true,
          onWebResourceError: (error) {
            print(error);
          },
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
