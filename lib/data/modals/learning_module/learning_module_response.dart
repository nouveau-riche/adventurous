/// description : "Module fetched successfully"
/// data : [{"_id":"6322ba0cd401a999e7c03c7f","title":"Sample Data","path":"/public/module/profile1663220236041_1663220236041.pdf","createdAt":"2022-09-15T05:37:16.050Z","updatedAt":"2022-09-15T05:37:16.050Z","__v":0}]
/// status : true

class LearningModuleResponse {
  LearningModuleResponse({
    this.description,
    this.data,
    this.status,
  });

  LearningModuleResponse.fromJson(dynamic json) {
    description = json['description'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Module.fromJson(v));
      });
    }
    status = json['status'];
  }

  String? description;
  List<Module>? data;
  bool? status;

  LearningModuleResponse copyWith({
    String? description,
    List<Module>? data,
    bool? status,
  }) =>
      LearningModuleResponse(
        description: description ?? this.description,
        data: data ?? this.data,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }
}

/// _id : "6322ba0cd401a999e7c03c7f"
/// title : "Sample Data"
/// path : "/public/module/profile1663220236041_1663220236041.pdf"
/// createdAt : "2022-09-15T05:37:16.050Z"
/// updatedAt : "2022-09-15T05:37:16.050Z"
/// __v : 0

class Module {
  Module({
    this.id,
    this.title,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Module.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    path = json['path'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? title;
  String? path;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['path'] = path;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
