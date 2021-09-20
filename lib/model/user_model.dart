class UserModel {
  int code;
  String status;
  Message message;
  Data data;

  UserModel({this.code, this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Message {
  List<String> success;

  Message({this.success});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class Data {
  User user;
  String accessToken;
  String tokenType;

  Data({this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int id;
  String planId;
  String firstname;
  String lastname;
  String username;
  String email;
  String countryCode;
  String mobile;
  Null refBy;
  String balance;
  String image;
  Address address;
  String status;
  String ev;
  String sv;
  Null verCode;
  Null verCodeSendAt;
  String ts;
  int tv;
  Null tsc;
  Null exp;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.planId,
      this.firstname,
      this.lastname,
      this.username,
      this.email,
      this.countryCode,
      this.mobile,
      this.refBy,
      this.balance,
      this.image,
      this.address,
      this.status,
      this.ev,
      this.sv,
      this.verCode,
      this.verCodeSendAt,
      this.ts,
      this.tv,
      this.tsc,
      this.exp,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['plan_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    refBy = json['ref_by'];
    balance = json['balance'];
    image = json['image'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    status = json['status'];
    ev = json['ev'];
    sv = json['sv'];
    verCode = json['ver_code'];
    verCodeSendAt = json['ver_code_send_at'];
    ts = json['ts'];
    tv = json['tv'];
    tsc = json['tsc'];
    exp = json['exp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_id'] = this.planId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['ref_by'] = this.refBy;
    data['balance'] = this.balance;
    data['image'] = this.image;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['status'] = this.status;
    data['ev'] = this.ev;
    data['sv'] = this.sv;
    data['ver_code'] = this.verCode;
    data['ver_code_send_at'] = this.verCodeSendAt;
    data['ts'] = this.ts;
    data['tv'] = this.tv;
    data['tsc'] = this.tsc;
    data['exp'] = this.exp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address {
  String address;
  String state;
  String zip;
  String country;
  String city;

  Address({this.address, this.state, this.zip, this.country, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
