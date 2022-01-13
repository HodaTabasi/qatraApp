import 'package:qatra_app/models/Order.dart';

class PaymentResponse {
  bool status;
  Order data;
  List<String> message;

  PaymentResponse({this.status, this.data, this.message});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Order.fromJson(json['data']) : null;
    // if (json['message'] != null) {
    //   message = new List<Null>();
    //   json['message'].forEach((v) {
    //     message.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    // if (this.message != null) {
    //   data['message'] = this.message.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}