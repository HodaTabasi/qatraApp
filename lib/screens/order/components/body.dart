import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/components/order_item.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/models/OrderResponse.dart';
import 'package:qatra_app/screens/order/components/order_item.dart';
import 'package:qatra_app/utils/SizeConfig.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  OrderResponse response;

  bool isLoading = false;

  getData() async {
    // final progress = ProgressHUD.of(context);
    // progress.show();

    response = await HttpService.apiHelper.getMyOrders();
    setState(() {
      // progress.dismiss();
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? response.status
            ? Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: MyOrderItem(response.data[index]),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text("some thing wrong"),
              )
        : Loading();
  }
}
