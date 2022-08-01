/// message : "Email address found successfully"
/// status : false

class BaseResponse {
  BaseResponse({
    this.message,
    this.description,
    this.status,
  });

  BaseResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    description = json['description'];
  }

  String? message;
  bool? status;
  String? description;

  BaseResponse copyWith({
    String? message,
    bool? status,
    String? description,
  }) =>
      BaseResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['description'] = description;
    return map;
  }
}
