/// message : "Profile fetched successfully"
/// status : true
/// data : {"_id":"630f91eb135c33949995681a","user_email":"nyadav2121@gmail.com","name":"adventure","dob":null,"age":0,"gender":"Not Updated","password":"$2b$10$1s21Ieeh5Okw9Snwdmdqp.sakwcwsO63cg0424VxAkHUba5wnx/J.","imageUrl":"Not Updated","country":"Not Updated","countryCode":"Not Updated","address":"Not Updated","bio":"Not Updated","adminVerification":false,"uid":"eTcPEyeptEkkadxCuawW4r","createdAt":"2022-08-31T16:52:59.807Z","updatedAt":"2022-08-31T17:00:31.897Z","__v":0}

class UserDetailResponse {
  UserDetailResponse({
    this.message,
    this.status,
    this.data,
  });

  UserDetailResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? UserProfile.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  UserProfile? data;

  UserDetailResponse copyWith({
    String? message,
    bool? status,
    UserProfile? data,
  }) =>
      UserDetailResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// _id : "630f91eb135c33949995681a"
/// user_email : "nyadav2121@gmail.com"
/// name : "adventure"
/// dob : null
/// age : 0
/// gender : "Not Updated"
/// password : "$2b$10$1s21Ieeh5Okw9Snwdmdqp.sakwcwsO63cg0424VxAkHUba5wnx/J."
/// imageUrl : "Not Updated"
/// country : "Not Updated"
/// countryCode : "Not Updated"
/// address : "Not Updated"
/// bio : "Not Updated"
/// adminVerification : false
/// uid : "eTcPEyeptEkkadxCuawW4r"
/// createdAt : "2022-08-31T16:52:59.807Z"
/// updatedAt : "2022-08-31T17:00:31.897Z"
/// __v : 0

class UserProfile {
  UserProfile({
    this.id,
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
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UserProfile.fromJson(dynamic json) {
    id = json['_id'];
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
    uid = json['uid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
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
  String? uid;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserProfile copyWith({
    String? id,
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
    String? uid,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      UserProfile(
        id: id ?? this.id,
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
        uid: uid ?? this.uid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
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
    map['uid'] = uid;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
