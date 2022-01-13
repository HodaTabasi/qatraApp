import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/components/customAppBar.dart';
import 'package:qatra_app/components/loading.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/helper/providers/profile_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ProfileResponse.dart';

import 'body.dart';

class PreBody extends StatefulWidget {
  @override
  State<PreBody> createState() => _PreBodyState();
}

class _PreBodyState extends State<PreBody> {
  // bool isLoading = false;
  ProfileResponse response;

  getData() async {
    final progress = ProgressHUD.of(context);
    progress.show();

    response = await HttpService.apiHelper.getMyProfile();
    setState(() {
      // isLoading = true;
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

        progress.dismiss();
      }
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
    return  response != null ? Body() : Container();
  }
}
