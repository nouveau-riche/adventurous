/// description : "User is not registered"
/// status : true
/// otp : 668861

class CheckEmailRegisterResponse {
  CheckEmailRegisterResponse({
    this.description,
    this.status,
    this.otp,
  });

  CheckEmailRegisterResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    otp = json['otp'];
  }

  String? description;
  bool? status;
  int? otp;

  CheckEmailRegisterResponse copyWith({
    String? description,
    bool? status,
    int? otp,
  }) =>
      CheckEmailRegisterResponse(
        description: description ?? this.description,
        status: status ?? this.status,
        otp: otp ?? this.otp,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    map['otp'] = otp;
    return map;
  }
}
