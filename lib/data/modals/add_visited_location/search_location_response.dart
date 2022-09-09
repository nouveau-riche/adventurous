/// description : "Location fetched successfully."
/// status : true
/// data : [{"name":"adventure","address":"akshit house street","locationId":"x1F6PMj8XCJny5zZ8dVTsU"},null]
/// total : 8

class SearchLocationResponse {
  SearchLocationResponse({
    this.description,
    this.status,
    this.data,
    this.total,
  });

  SearchLocationResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SearchedLocation.fromJson(v));
      });
    }
    total = json['total'];
  }

  String? description;
  bool? status;
  List<SearchedLocation>? data;
  int? total;

  SearchLocationResponse copyWith({
    String? description,
    bool? status,
    List<SearchedLocation>? data,
    int? total,
  }) =>
      SearchLocationResponse(
        description: description ?? this.description,
        status: status ?? this.status,
        data: data ?? this.data,
        total: total ?? this.total,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    return map;
  }
}

/// name : "adventure"
/// address : "akshit house street"
/// locationId : "x1F6PMj8XCJny5zZ8dVTsU"

class SearchedLocation {
  SearchedLocation({
    this.name,
    this.address,
    this.locationId,
  });

  SearchedLocation.fromJson(dynamic json) {
    name = json['name'];
    address = json['address'];
    locationId = json['locationId'];
  }

  String? name;
  String? address;
  String? locationId;

  SearchedLocation copyWith({
    String? name,
    String? address,
    String? locationId,
  }) =>
      SearchedLocation(
        name: name ?? this.name,
        address: address ?? this.address,
        locationId: locationId ?? this.locationId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['address'] = address;
    map['locationId'] = locationId;
    return map;
  }
}
