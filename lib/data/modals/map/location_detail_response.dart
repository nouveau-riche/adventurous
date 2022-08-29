import 'dart:convert';

/// description : "Container fetched successfully."
/// status : true
/// data : [{"_id":"62e8f50c2301f55a559e04fd","createdBy":"theadventurouslearner2022@gmail.com","name":"nitish","address":"House No. 4 Ground Floor Gurgaon","contactNo":"7027221181","countryCode":"+91","websiteLink":"www.google.com","description":"Nitish House","learningOpportunity":"learn the backend structures","locationId":"koDVu8GQy4K6JYveY6EziZ","location":{"type":"Point","coordinates":[76.958222,28.394589]},"attachment":[{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542300484.png","fileType":"Images","_id":"62ea9b1c4f6c00f493739063","createdAt":"2022-08-03T15:58:20.489Z","updatedAt":"2022-08-03T15:58:20.489Z"}],"createdAt":"2022-08-02T09:57:32.223Z","updatedAt":"2022-08-02T09:57:32.223Z","__v":0,"distance":0,"reviews":[{"_id":"62ea9aa1653a1311bdf4e300","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a good place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"nt29vswuAziMsBBJ7M87iH","attachment":[{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e301","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e302","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/nt29vswuAziMsBBJ7M87iH/1659542698053.png","fileType":"Images","_id":"62ea9caa6bb98000455ac3e2","createdAt":"2022-08-03T16:04:58.119Z","updatedAt":"2022-08-03T16:04:58.119Z"}],"createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T16:08:07.962Z","__v":1},{"_id":"62ea9b0d4f6c00f49373905f","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a nice Place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"qoCb7wiLuQ4uYhnYJxmi6e","attachment":[],"createdAt":"2022-08-03T15:58:05.447Z","updatedAt":"2022-08-03T15:58:05.447Z","__v":0},{"_id":"62ea9b1c4f6c00f493739062","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a nice Place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"eS3LrHGCNpLaNCbLZDLHDd","attachment":[{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542300484.png","fileType":"Images","_id":"62ea9b1c4f6c00f493739063","createdAt":"2022-08-03T15:58:20.489Z","updatedAt":"2022-08-03T15:58:20.489Z"}],"createdAt":"2022-08-03T15:58:20.490Z","updatedAt":"2022-08-03T15:58:20.490Z","__v":0}]},null]

class LocationDetailResponse {
  LocationDetailResponse({
    this.description,
    this.status,
    this.data,
  });

  LocationDetailResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LocationDetail.fromJson(v));
      });
    }
  }

  String? description;
  bool? status;
  List<LocationDetail>? data;

  LocationDetailResponse copyWith({
    String? description,
    bool? status,
    List<LocationDetail>? data,
  }) =>
      LocationDetailResponse(
        description: description ?? this.description,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "62e8f50c2301f55a559e04fd"
/// createdBy : "theadventurouslearner2022@gmail.com"
/// name : "nitish"
/// address : "House No. 4 Ground Floor Gurgaon"
/// contactNo : "7027221181"
/// countryCode : "+91"
/// websiteLink : "www.google.com"
/// description : "Nitish House"
/// learningOpportunity : "learn the backend structures"
/// locationId : "koDVu8GQy4K6JYveY6EziZ"
/// location : {"type":"Point","coordinates":[76.958222,28.394589]}
/// attachment : [{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542300484.png","fileType":"Images","_id":"62ea9b1c4f6c00f493739063","createdAt":"2022-08-03T15:58:20.489Z","updatedAt":"2022-08-03T15:58:20.489Z"}]
/// createdAt : "2022-08-02T09:57:32.223Z"
/// updatedAt : "2022-08-02T09:57:32.223Z"
/// __v : 0
/// distance : 0
/// reviews : [{"_id":"62ea9aa1653a1311bdf4e300","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a good place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"nt29vswuAziMsBBJ7M87iH","attachment":[{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e301","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e302","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/nt29vswuAziMsBBJ7M87iH/1659542698053.png","fileType":"Images","_id":"62ea9caa6bb98000455ac3e2","createdAt":"2022-08-03T16:04:58.119Z","updatedAt":"2022-08-03T16:04:58.119Z"}],"createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T16:08:07.962Z","__v":1},{"_id":"62ea9b0d4f6c00f49373905f","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a nice Place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"qoCb7wiLuQ4uYhnYJxmi6e","attachment":[],"createdAt":"2022-08-03T15:58:05.447Z","updatedAt":"2022-08-03T15:58:05.447Z","__v":0},{"_id":"62ea9b1c4f6c00f493739062","createdBy":"theadventurouslearner2022@gmail.com","text":"it is a nice Place","rating":4,"locationId":"koDVu8GQy4K6JYveY6EziZ","reviewId":"eS3LrHGCNpLaNCbLZDLHDd","attachment":[{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542300484.png","fileType":"Images","_id":"62ea9b1c4f6c00f493739063","createdAt":"2022-08-03T15:58:20.489Z","updatedAt":"2022-08-03T15:58:20.489Z"}],"createdAt":"2022-08-03T15:58:20.490Z","updatedAt":"2022-08-03T15:58:20.490Z","__v":0}]

class LocationDetail {
  LocationDetail({
    this.id,
    this.createdBy,
    this.name,
    this.address,
    this.contactNo,
    this.countryCode,
    this.websiteLink,
    this.description,
    this.learningOpportunity,
    this.locationId,
    this.location,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.distance,
    this.rating,
    this.ratingCount,
    this.reviews,
    this.reviewAdd,
    this.reviewImages,
  });

  LocationDetail.fromJson(dynamic json) {
    id = json['_id'];
    createdBy = json['createdBy'];
    name = json['name'];
    address = json['address'];
    contactNo = json['contactNo'];
    countryCode = json['countryCode'];
    websiteLink = json['websiteLink'];
    description = json['description'];
    learningOpportunity = json['learningOpportunity'];
    locationId = json['locationId'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['attachment'] != null) {
      attachment = [];
      json['attachment'].forEach((v) {
        attachment?.add(Attachment.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    distance = json['distance'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    reviewAdd = json['reviewAdd'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    if (json['reviewImages'] != null) {
      reviewImages = [];
      json['reviewImages'].forEach((v) {
        reviewImages?.add(Attachment.fromJson(v));
      });
    }
  }

  String? id;
  String? createdBy;
  String? name;
  String? address;
  String? contactNo;
  String? countryCode;
  String? websiteLink;
  String? description;
  String? learningOpportunity;
  String? locationId;
  Location? location;
  List<Attachment>? attachment;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? distance;
  num? rating;
  num? ratingCount;
  bool? reviewAdd;
  List<Reviews>? reviews;
  List<Attachment>? reviewImages;

  LocationDetail copyWith({
    String? id,
    String? createdBy,
    String? name,
    String? address,
    String? contactNo,
    String? countryCode,
    String? websiteLink,
    String? description,
    String? learningOpportunity,
    String? locationId,
    Location? location,
    List<Attachment>? attachment,
    String? createdAt,
    String? updatedAt,
    int? v,
    double? distance,
    num? rating,
    bool? reviewAdd,
    num? ratingCount,
    List<Reviews>? reviews,
    List<Attachment>? reviewImages,
  }) =>
      LocationDetail(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        name: name ?? this.name,
        address: address ?? this.address,
        contactNo: contactNo ?? this.contactNo,
        countryCode: countryCode ?? this.countryCode,
        websiteLink: websiteLink ?? this.websiteLink,
        description: description ?? this.description,
        learningOpportunity: learningOpportunity ?? this.learningOpportunity,
        locationId: locationId ?? this.locationId,
        location: location ?? this.location,
        attachment: attachment ?? this.attachment,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        distance: distance ?? this.distance,
        rating: rating ?? this.rating,
        ratingCount: ratingCount ?? this.ratingCount,
        reviews: reviews ?? this.reviews,
        reviewAdd: reviewAdd ?? this.reviewAdd,
        reviewImages: reviewImages ?? this.reviewImages,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['createdBy'] = createdBy;
    map['name'] = name;
    map['address'] = address;
    map['contactNo'] = contactNo;
    map['countryCode'] = countryCode;
    map['websiteLink'] = websiteLink;
    map['description'] = description;
    map['learningOpportunity'] = learningOpportunity;
    map['locationId'] = locationId;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (attachment != null) {
      map['attachment'] = attachment?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['distance'] = distance;
    map['rating'] = rating;
    map['reviewAdd'] = reviewAdd;
    map['ratingCount'] = ratingCount;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (reviewImages != null) {
      map['reviewImages'] = reviewImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "62ea9aa1653a1311bdf4e300"
/// createdBy : "theadventurouslearner2022@gmail.com"
/// text : "it is a good place"
/// rating : 4
/// locationId : "koDVu8GQy4K6JYveY6EziZ"
/// reviewId : "nt29vswuAziMsBBJ7M87iH"
/// attachment : [{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e301","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png","fileType":"Images","_id":"62ea9aa1653a1311bdf4e302","createdAt":"2022-08-03T15:56:17.882Z","updatedAt":"2022-08-03T15:56:17.882Z"},{"filePath":"/public/nt29vswuAziMsBBJ7M87iH/1659542698053.png","fileType":"Images","_id":"62ea9caa6bb98000455ac3e2","createdAt":"2022-08-03T16:04:58.119Z","updatedAt":"2022-08-03T16:04:58.119Z"}]
/// createdAt : "2022-08-03T15:56:17.882Z"
/// updatedAt : "2022-08-03T16:08:07.962Z"
/// __v : 1

class Reviews {
  Reviews({
    this.id,
    this.createdBy,
    this.createdByName,
    this.text,
    this.rating,
    this.locationId,
    this.reviewId,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Reviews.fromJson(dynamic json) {
    id = json['_id'];
    createdBy = json['createdBy'];
    createdByName = json['createdByName'];
    text = json['text'];
    rating = json['rating'];
    locationId = json['locationId'];
    reviewId = json['reviewId'];
    if (json['attachment'] != null) {
      attachment = [];
      json['attachment'].forEach((v) {
        attachment?.add(Attachment.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? createdBy;
  String? createdByName;
  String? text;
  int? rating;
  String? locationId;
  String? reviewId;
  List<Attachment>? attachment;
  String? createdAt;
  String? updatedAt;
  int? v;

  Reviews copyWith({
    String? id,
    String? createdBy,
    String? createdByName,
    String? text,
    int? rating,
    String? locationId,
    String? reviewId,
    List<Attachment>? attachment,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Reviews(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdByName: createdByName ?? this.createdByName,
        text: text ?? this.text,
        rating: rating ?? this.rating,
        locationId: locationId ?? this.locationId,
        reviewId: reviewId ?? this.reviewId,
        attachment: attachment ?? this.attachment,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['createdBy'] = createdBy;
    map['createdByName'] = createdByName;
    map['text'] = text;
    map['rating'] = rating;
    map['locationId'] = locationId;
    map['reviewId'] = reviewId;
    if (attachment != null) {
      map['attachment'] = attachment?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

/// filePath : "/public/review/koDVu8GQy4K6JYveY6EziZ/1659542177877.png"
/// fileType : "Images"
/// _id : "62ea9aa1653a1311bdf4e301"
/// createdAt : "2022-08-03T15:56:17.882Z"
/// updatedAt : "2022-08-03T15:56:17.882Z"

Attachment attachmentFromJson(String str) =>
    Attachment.fromJson(json.decode(str));

String attachmentToJson(Attachment data) => json.encode(data.toJson());

class Attachment {
  Attachment({
    this.filePath,
    this.fileType,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  Attachment.fromJson(dynamic json) {
    filePath = json['filePath'];
    fileType = json['fileType'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? filePath;
  String? fileType;
  String? id;
  String? createdAt;
  String? updatedAt;

  Attachment copyWith({
    String? filePath,
    String? fileType,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) =>
      Attachment(
        filePath: filePath ?? this.filePath,
        fileType: fileType ?? this.fileType,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filePath'] = filePath;
    map['fileType'] = fileType;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

/// type : "Point"
/// coordinates : [76.958222,28.394589]

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates =
        json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }

  String? type;
  List<double>? coordinates;

  Location copyWith({
    String? type,
    List<double>? coordinates,
  }) =>
      Location(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }
}
