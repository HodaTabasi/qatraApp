import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nameInCardController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final yearController = TextEditingController();
  int mosqueType = 1;
  int quantity = 0;


  increment(){
    quantity++;
    notifyListeners();
  }

  decrement(){
    quantity--;
    notifyListeners();
  }

  disposeController(){
    nameController.clear();
    phoneController.clear();
    nameInCardController.clear();
    cardNumberController.clear();
    cvvController.clear();
    yearController.clear();
  }
}