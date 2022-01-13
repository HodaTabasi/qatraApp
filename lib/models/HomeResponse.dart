import 'Mosque.dart';

class HomeResponse {
  bool status;
  List<Mosque> data;
  List<String> message;

  HomeResponse({this.status, this.data, this.message});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Mosque>[];
      json['data'].forEach((v) {
        data.add(new Mosque.fromJson(v));
      });
    }
    if (json['message'] != null) {
      message = new List<String>();
      json['message'].forEach((v) {
        message.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.message != null) {
      data['message'] = this.message.map((v) => v).toList();
    }
    return data;
  }
}
