import 'dart:convert';

/// description : "Content fetched successfully"
/// contentData : {"_id":"630248c48564bef07b93fec2","type":"HOME","description":"Hi! John Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorperviverra. Integereuismod magna nec, varius pretium morbi. Nunc aliquet justo purus sit tempor. Eu sit eu libero nunc placerat libero nunc quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, situllamcorper viverra","createdAt":"2022-08-21T15:01:24.446Z","updatedAt":"2022-08-21T15:01:24.446Z","__v":0}
/// status : true

class HomeContentResponse {
  HomeContentResponse({
    this.description,
    this.contentData,
    this.status,
    this.name,
  });

  HomeContentResponse.fromJson(dynamic json) {
    description = json['description'];
    contentData = json['contentData'] != null
        ? ContentData.fromJson(json['contentData'])
        : null;
    status = json['status'];
    name = json['name'];
  }

  String? description;
  ContentData? contentData;
  bool? status;
  String? name;

  HomeContentResponse copyWith({
    String? description,
    ContentData? contentData,
    bool? status,
    String? name,
  }) =>
      HomeContentResponse(
        description: description ?? this.description,
        contentData: contentData ?? this.contentData,
        status: status ?? this.status,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (contentData != null) {
      map['contentData'] = contentData?.toJson();
    }
    map['status'] = status;
    map['name'] = name;
    return map;
  }
}

/// _id : "630248c48564bef07b93fec2"
/// type : "HOME"
/// description : "Hi! John Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, sit ullamcorperviverra. Integereuismod magna nec, varius pretium morbi. Nunc aliquet justo purus sit tempor. Eu sit eu libero nunc placerat libero nunc quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id lobortis enim, situllamcorper viverra"
/// createdAt : "2022-08-21T15:01:24.446Z"
/// updatedAt : "2022-08-21T15:01:24.446Z"
/// __v : 0

class ContentData {
  ContentData({
    this.id,
    this.type,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ContentData.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? type;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? v;

  ContentData copyWith({
    String? id,
    String? type,
    String? description,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      ContentData(
        id: id ?? this.id,
        type: type ?? this.type,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
