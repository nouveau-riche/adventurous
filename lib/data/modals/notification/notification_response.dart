/// description : "Notifications fetched successfully"
/// status : true
/// notification : [{"_id":"63246a5c6123a057016e515a","uid":"ebVM8sNhjpQ9bkynBSgJNd","playerID":"a95f15c1-b794-4148-96f2-94587d4399d5","title":"test","body":"test postman body","__v":0,"createdAt":"2022-09-16T12:21:48.404Z","updatedAt":"2022-09-16T12:21:48.404Z"}]
/// totalDocuments : 1

class NotificationResponse {
  NotificationResponse({
    this.description,
    this.status,
    this.notification,
    this.totalDocuments,
  });

  NotificationResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    if (json['notification'] != null) {
      notification = [];
      json['notification'].forEach((v) {
        notification?.add(Notification.fromJson(v));
      });
    }
    totalDocuments = json['totalDocuments'];
  }

  String? description;
  bool? status;
  List<Notification>? notification;
  int? totalDocuments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    if (notification != null) {
      map['notification'] = notification?.map((v) => v.toJson()).toList();
    }
    map['totalDocuments'] = totalDocuments;
    return map;
  }
}

/// _id : "63246a5c6123a057016e515a"
/// uid : "ebVM8sNhjpQ9bkynBSgJNd"
/// playerID : "a95f15c1-b794-4148-96f2-94587d4399d5"
/// title : "test"
/// body : "test postman body"
/// __v : 0
/// createdAt : "2022-09-16T12:21:48.404Z"
/// updatedAt : "2022-09-16T12:21:48.404Z"

class Notification {
  Notification({
    this.id,
    this.uid,
    this.playerID,
    this.title,
    this.body,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  Notification.fromJson(dynamic json) {
    id = json['_id'];
    uid = json['uid'];
    playerID = json['playerID'];
    title = json['title'];
    body = json['body'];
    v = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? uid;
  String? playerID;
  String? title;
  String? body;
  int? v;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['uid'] = uid;
    map['playerID'] = playerID;
    map['title'] = title;
    map['body'] = body;
    map['__v'] = v;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
