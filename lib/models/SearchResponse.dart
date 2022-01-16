import 'package:qatra_app/models/Mosque.dart';

class SearchResponse {
  bool status;
  Data data;
  List<String> message;

  SearchResponse({this.status, this.data, this.message});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['message'] != null) {
      message = <Null>[];
      json['message'].forEach((v) {
        message.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message.map((v) => v).toList();
    }
    return data;
  }
}

class Data {
  List<Mosque> mosques;
  String token;

  Data({this.mosques, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['mosques'] != null) {
      mosques = <Mosque>[];
      json['mosques'].forEach((v) {
        mosques.add(new Mosque.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mosques != null) {
      data['mosques'] = this.mosques.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}
