import 'package:qatra_app/models/Product.dart';

import 'Mosque.dart';

class productDitails {
  bool status;
  Data data;
  List<String> message;

  productDitails({this.status, this.data, this.message});

  productDitails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  Mosque mosque;
  Product product;

  Data({this.mosque, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    mosque =
    json['mosque'] != null ? new Mosque.fromJson(json['mosque']) : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mosque != null) {
      data['mosque'] = this.mosque.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

