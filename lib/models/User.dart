/// id : 1
/// first_name : null
/// last_name : null
/// email : "sami@mail.com"
/// email_verified_at : null
/// phone : "12345678"
/// is_phone_verified : 0
/// created_at : "2021-09-17T19:33:00.000000Z"
/// updated_at : "2021-09-17T19:33:00.000000Z"
/// gender : "male"
/// country : null
/// address : null
/// sms_token_validation : null
/// isBan : false

class User {
  User({
    int id,
    String firstName,
    String lastName,
    String email,
    String emailVerifiedAt,
    String phone,
    String isPhoneVerified,
    String createdAt,
    String updatedAt,
    String gender,
    String country,
    String address,
    String smsTokenValidation,
    bool isBan,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
    _isPhoneVerified = isPhoneVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _gender = gender;
    _country = country;
    _address = address;
    _smsTokenValidation = smsTokenValidation;
    _isBan = isBan;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
    _isPhoneVerified = json['is_phone_verified'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _gender = json['gender'];
    _country = json['country'];
    _address = json['address'];
    _smsTokenValidation = json['sms_token_validation'];
    _isBan = json['isBan'];
  }
  int _id;

  set id(int value) {
    _id = value;
  }

  dynamic _firstName;
  dynamic _lastName;
  String _email;
  dynamic _emailVerifiedAt;
  String _phone;
  String _isPhoneVerified;
  String _createdAt;
  String _updatedAt;
  String _gender;
  dynamic _country;
  dynamic _address;
  dynamic _smsTokenValidation;
  bool _isBan;
  String _password;


  String get password => _password;

  set password(String value) {
    _password = value;
  }

  int get id => _id;
  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  String get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String get phone => _phone;
  String get isPhoneVerified => _isPhoneVerified;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get gender => _gender;
  dynamic get country => _country;
  dynamic get address => _address;
  dynamic get smsTokenValidation => _smsTokenValidation;
  bool get isBan => _isBan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
    map['is_phone_verified'] = _isPhoneVerified;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['gender'] = _gender;
    map['country'] = _country;
    map['address'] = _address;
    map['sms_token_validation'] = _smsTokenValidation;
    map['isBan'] = _isBan;
    map['password'] = _password;
    return map;
  }

  set firstName(dynamic value) {
    _firstName = value;
  }

  set lastName(dynamic value) {
    _lastName = value;
  }

  set email(String value) {
    _email = value;
  }

  set emailVerifiedAt(dynamic value) {
    _emailVerifiedAt = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set isPhoneVerified(String value) {
    _isPhoneVerified = value;
  }

  set createdAt(String value) {
    _createdAt = value;
  }

  set updatedAt(String value) {
    _updatedAt = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set country(dynamic value) {
    _country = value;
  }

  set address(dynamic value) {
    _address = value;
  }

  set smsTokenValidation(dynamic value) {
    _smsTokenValidation = value;
  }

  set isBan(bool value) {
    _isBan = value;
  }
}
