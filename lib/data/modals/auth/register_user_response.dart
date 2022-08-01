/// message : "new User created successfully"
/// data : {"user_email":"theadventurousleaner2022@gmail.com","name":"adventure","dob":null,"age":0,"gender":"Not Updated","password":"$2b$10$YjszkxoGbfMdw9ULexmGvOl6F0jSYWBu40r/ygAK.dwYJWXExQ2wm","imageUrl":"Not Updated","country":"Not Updated","countryCode":"Not Updated","address":"Not Updated","bio":"Not Updated","adminVerification":false,"_id":"62df929bc1548c85d9f7aeef","createdAt":"2022-07-26T07:07:07.791Z","updatedAt":"2022-07-26T07:07:07.791Z","__v":0}
/// status : true
/// x-access-token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2VtYWlsIjoidGhlYWR2ZW50dXJvdXNsZWFuZXIyMDIyQGdtYWlsLmNvbSIsImlhdCI6MTY1ODgxOTIyN30.ZP9o-oQGMuOM57BoDBZa6trqw7ii0Ynt9He0YbXL2jg"

class RegisterUserResponse {
  RegisterUserResponse({
    this.message,
    this.data,
    this.status,
    this.xaccesstoken,
  });

  RegisterUserResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
    status = json['status'];
    xaccesstoken = json['x-access-token'];
  }

  String? message;
  User? data;
  bool? status;
  String? xaccesstoken;

  RegisterUserResponse copyWith({
    String? message,
    User? data,
    bool? status,
    String? xaccesstoken,
  }) =>
      RegisterUserResponse(
        message: message ?? this.message,
        data: data ?? this.data,
        status: status ?? this.status,
        xaccesstoken: xaccesstoken ?? this.xaccesstoken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['x-access-token'] = xaccesstoken;
    return map;
  }
}

/// user_email : "theadventurousleaner2022@gmail.com"
/// name : "adventure"
/// dob : null
/// age : 0
/// gender : "Not Updated"
/// password : "$2b$10$YjszkxoGbfMdw9ULexmGvOl6F0jSYWBu40r/ygAK.dwYJWXExQ2wm"
/// imageUrl : "Not Updated"
/// country : "Not Updated"
/// countryCode : "Not Updated"
/// address : "Not Updated"
/// bio : "Not Updated"
/// adminVerification : false
/// _id : "62df929bc1548c85d9f7aeef"
/// createdAt : "2022-07-26T07:07:07.791Z"
/// updatedAt : "2022-07-26T07:07:07.791Z"
/// __v : 0

class User {
  User({
    this.userEmail,
    this.name,
    this.dob,
    this.age,
    this.gender,
    this.password,
    this.imageUrl,
    this.country,
    this.countryCode,
    this.address,
    this.bio,
    this.adminVerification,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  User.fromJson(dynamic json) {
    userEmail = json['user_email'];
    name = json['name'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    password = json['password'];
    imageUrl = json['imageUrl'];
    country = json['country'];
    countryCode = json['countryCode'];
    address = json['address'];
    bio = json['bio'];
    adminVerification = json['adminVerification'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? userEmail;
  String? name;
  dynamic dob;
  int? age;
  String? gender;
  String? password;
  String? imageUrl;
  String? country;
  String? countryCode;
  String? address;
  String? bio;
  bool? adminVerification;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  User copyWith({
    String? userEmail,
    String? name,
    dynamic dob,
    int? age,
    String? gender,
    String? password,
    String? imageUrl,
    String? country,
    String? countryCode,
    String? address,
    String? bio,
    bool? adminVerification,
    String? id,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      User(
        userEmail: userEmail ?? this.userEmail,
        name: name ?? this.name,
        dob: dob ?? this.dob,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        password: password ?? this.password,
        imageUrl: imageUrl ?? this.imageUrl,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        address: address ?? this.address,
        bio: bio ?? this.bio,
        adminVerification: adminVerification ?? this.adminVerification,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_email'] = userEmail;
    map['name'] = name;
    map['dob'] = dob;
    map['age'] = age;
    map['gender'] = gender;
    map['password'] = password;
    map['imageUrl'] = imageUrl;
    map['country'] = country;
    map['countryCode'] = countryCode;
    map['address'] = address;
    map['bio'] = bio;
    map['adminVerification'] = adminVerification;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
