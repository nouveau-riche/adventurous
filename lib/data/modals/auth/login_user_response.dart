/// description : "Your profile is created waiting for the admin to verify"
/// status : true
/// x-access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2VtYWlsIjoidGhlYWR2ZW50dXJvdXNsZWFuZXIyMDIyQGdtYWlsLmNvbSIsImlhdCI6MTY1ODgxOTkxOX0.KRVWs-HWubjaeXLWnuYa-00g3kIBqlkPqmgMCp-UMUY"

class LoginUserResponse {
  LoginUserResponse({
    this.description,
    this.status,
    this.xaccessToken,
  });

  LoginUserResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    xaccessToken = json['x-access_token'];
  }

  String? description;
  bool? status;
  String? xaccessToken;

  LoginUserResponse copyWith({
    String? description,
    bool? status,
    String? xaccessToken,
  }) =>
      LoginUserResponse(
        description: description ?? this.description,
        status: status ?? this.status,
        xaccessToken: xaccessToken ?? this.xaccessToken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    map['x-access_token'] = xaccessToken;
    return map;
  }
}
