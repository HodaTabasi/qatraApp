class ResetModel {
  /*
  email:ahmad@mail.com
token:004892027567fcee959e7bc939beab53bc2168ed52b8de19256ee6a2772b0cbf
password:Password@123456789
password_confirmation:Password@123456789
type:mobile
phone:123456789
sms_verification:123456
   */
  String email;
  String token;
  String password;
  String passwordConfirmation;
  String type;
  String phone;
  String smsVerification;

  ResetModel(
      {this.email,
      this.token,
      this.password,
      this.passwordConfirmation,
      this.type,
      this.phone,
      this.smsVerification});

  ResetModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    type = json['type'];
    phone = json['phone'];
    smsVerification = json['sms_verification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['type'] = this.type;
    data['phone'] = this.phone;
    data['sms_verification'] = this.smsVerification;
    return data;
  }
}
