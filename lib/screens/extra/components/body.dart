import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/models/SettingResponse.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SettingResponse response;
  bool isLoading = false;

  onCreate() async {
    // final progress = ProgressHUD.of(context);
    // progress.show();
    response = await HttpService.apiHelper.getSetting();
    if (response.status) {
      setState(() {
        isLoading = true;
        // progress.dismiss();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onCreate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: response.status
                      ? Text(
                          response.data != null ? response.data.value : " ",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff707070)),
                        )
                      : Text("something error"),
                ),
              )
            : Loading(),
      ],
    );
  }
}
