class ForgetPassResponse {
  bool status;
  List<String> message;
  // String data;

  ForgetPassResponse({this.status, this.message/*, this.data*/});

  ForgetPassResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'].cast<String>();
    // data = json['data'] != null ? json['data'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data;
    // }
    return data;
  }
}
