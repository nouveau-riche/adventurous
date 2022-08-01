/// description : "Otp sent on mail successfully"
/// otp : 355738

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    this.description,
    this.otp,
  });

  ForgotPasswordResponse.fromJson(dynamic json) {
    description = json['description'];
    otp = json['otp'];
  }

  String? description;
  int? otp;

  ForgotPasswordResponse copyWith({
    String? description,
    int? otp,
  }) =>
      ForgotPasswordResponse(
        description: description ?? this.description,
        otp: otp ?? this.otp,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['otp'] = otp;
    return map;
  }
}
