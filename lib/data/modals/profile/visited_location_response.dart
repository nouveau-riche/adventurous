import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';

/// description : "Visited fetched successfully."
/// status : true
/// data : [{"_id":"630f9736340978791a6ae023","uid":"eTcPEyeptEkkadxCuawW4r","locationId":"9UEWzCtNAYgeoD5C1L5sag","createdAt":"2022-08-31T17:15:34.501Z","updatedAt":"2022-08-31T17:15:34.501Z","__v":0,"locations":[{"_id":"62e9063b2aa1ff750c1018f4","createdBy":"theadventurouslearner2022@gmail.com","name":"adventure","address":"near outer street","contactNo":"7027221181","countryCode":"+91","websiteLink":"https://www.google.com","description":"near street House","learningOpportunity":"learn the frond end structures","locationId":"9UEWzCtNAYgeoD5C1L5sag","location":{"type":"Point","coordinates":[76.957401,28.390054]},"attachment":[],"createdAt":"2022-08-02T11:10:51.435Z","updatedAt":"2022-08-31T17:19:41.469Z","rating":5,"__v":0,"createdByName":"Adventure","ratingCount":1,"totalRating":5,"reviews":[{"_id":"630f982df181f49a7b898289","uid":"3FzeSMuLS5i8ERS2pdp3xE","createdBy":"nitish.yadav@gmail.com","createdByName":"adventure","text":"it is a nice Place","rating":5,"locationId":"9UEWzCtNAYgeoD5C1L5sag","reviewId":"hxutXVSndS1bPR9XzQjRZF","attachment":[],"createdAt":"2022-08-31T17:19:41.413Z","updatedAt":"2022-08-31T17:19:41.413Z","__v":0}],"reviewAdded":[]}]}]
/// total : 1

class VisitedLocationResponse {
  VisitedLocationResponse({
    this.description,
    this.status,
    this.data,
    this.total,
    this.userLocations,
  });

  VisitedLocationResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserLocationList.fromJson(v));
      });
    }
    if (json['userLocation'] != null) {
      userLocations = [];
      json['userLocation'].forEach((v) {
        userLocations?.add(LocationDetail.fromJson(v));
      });
    }
    total = json['total'];
  }

  String? description;
  bool? status;
  List<UserLocationList>? data;
  List<LocationDetail>? userLocations;
  int? total;

  VisitedLocationResponse copyWith({
    String? description,
    bool? status,
    List<UserLocationList>? data,
    int? total,
    List<LocationDetail>? userLocations,
  }) =>
      VisitedLocationResponse(
        description: description ?? this.description,
        status: status ?? this.status,
        data: data ?? this.data,
        total: total ?? this.total,
        userLocations: userLocations ?? this.userLocations,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (userLocations != null) {
      map['userLocation'] = userLocations?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    return map;
  }
}

/// _id : "630f9736340978791a6ae023"
/// uid : "eTcPEyeptEkkadxCuawW4r"
/// locationId : "9UEWzCtNAYgeoD5C1L5sag"
/// createdAt : "2022-08-31T17:15:34.501Z"
/// updatedAt : "2022-08-31T17:15:34.501Z"
/// __v : 0
/// locations : [{"_id":"62e9063b2aa1ff750c1018f4","createdBy":"theadventurouslearner2022@gmail.com","name":"adventure","address":"near outer street","contactNo":"7027221181","countryCode":"+91","websiteLink":"https://www.google.com","description":"near street House","learningOpportunity":"learn the frond end structures","locationId":"9UEWzCtNAYgeoD5C1L5sag","location":{"type":"Point","coordinates":[76.957401,28.390054]},"attachment":[],"createdAt":"2022-08-02T11:10:51.435Z","updatedAt":"2022-08-31T17:19:41.469Z","rating":5,"__v":0,"createdByName":"Adventure","ratingCount":1,"totalRating":5,"reviews":[{"_id":"630f982df181f49a7b898289","uid":"3FzeSMuLS5i8ERS2pdp3xE","createdBy":"nitish.yadav@gmail.com","createdByName":"adventure","text":"it is a nice Place","rating":5,"locationId":"9UEWzCtNAYgeoD5C1L5sag","reviewId":"hxutXVSndS1bPR9XzQjRZF","attachment":[],"createdAt":"2022-08-31T17:19:41.413Z","updatedAt":"2022-08-31T17:19:41.413Z","__v":0}],"reviewAdded":[]}]

class UserLocationList {
  UserLocationList({
    this.id,
    this.uid,
    this.locationId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.locations,
  });

  UserLocationList.fromJson(dynamic json) {
    id = json['_id'];
    uid = json['uid'];
    locationId = json['locationId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations?.add(LocationDetail.fromJson(v));
      });
    }
  }

  String? id;
  String? uid;
  String? locationId;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<LocationDetail>? locations;

  UserLocationList copyWith({
    String? id,
    String? uid,
    String? locationId,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<LocationDetail>? locations,
  }) =>
      UserLocationList(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        locations: locations ?? this.locations,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['uid'] = uid;
    map['locationId'] = locationId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    if (locations != null) {
      map['locations'] = locations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
