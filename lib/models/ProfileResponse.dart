import 'package:qatra_app/models/User.dart';

class ProfileResponse {
  bool status;
  User data;
  List<String> message;

  ProfileResponse({this.status, this.data, this.message});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    // if (json['message'] != null) {
    //   message = <String>[];
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

