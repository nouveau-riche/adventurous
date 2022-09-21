/// description : "Contact fetched successfully"
/// data : {"_id":"6322b76de01363cabc4df0eb","email":"support@adventure.com","description":"Sample Data","imageURL":"/public/contact/profile1663219565226_1663219565225.png","createdAt":"2022-09-15T05:26:05.228Z","updatedAt":"2022-09-15T05:26:05.228Z","__v":0}
/// status : true

class ContactUsResponse {
  ContactUsResponse({
    this.description,
    this.data,
    this.status,
  });

  ContactUsResponse.fromJson(dynamic json) {
    description = json['description'];
    data = json['data'] != null ? ContactDetails.fromJson(json['data']) : null;
    status = json['status'];
  }

  String? description;
  ContactDetails? data;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

/// _id : "6322b76de01363cabc4df0eb"
/// email : "support@adventure.com"
/// description : "Sample Data"
/// imageURL : "/public/contact/profile1663219565226_1663219565225.png"
/// createdAt : "2022-09-15T05:26:05.228Z"
/// updatedAt : "2022-09-15T05:26:05.228Z"
/// __v : 0

class ContactDetails {
  ContactDetails({
    this.id,
    this.email,
    this.description,
    this.imageURL,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ContactDetails.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    description = json['description'];
    imageURL = json['imageURL'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? email;
  String? description;
  String? imageURL;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['description'] = description;
    map['imageURL'] = imageURL;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
