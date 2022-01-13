import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/models/SettingResponse.dart';

import 'components/body.dart';

class Extra extends StatelessWidget {
  static String routeName = "/extra";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("extra"),
        body: Body(),
        // ProgressHUD(child: Body())
    );
  }
}
