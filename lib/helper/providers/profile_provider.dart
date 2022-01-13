import 'package:flutter/material.dart';
import 'package:qatra_app/models/User.dart';
import 'package:qatra_app/models/productDitailsResponse.dart';

class ProfileProvider extends ChangeNotifier{
  final profileFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String gender;

  User user;

  disposeController(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

}