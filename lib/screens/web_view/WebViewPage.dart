import 'package:flutter/material.dart';
import 'package:qatra_app/components/customAppBar.dart';

import 'component/body.dart';

class WebViewPage extends StatefulWidget {

  static String routeName = "/web_payment";

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("عمليه الدفع") ,
      body: Body(),
      // body: ProgressHUD(child: Body()),
    );
  }
}
