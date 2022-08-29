/// html_attributions : []
/// result : {"formatted_address":"Gwalior, Madhya Pradesh, India","geometry":{"location":{"lat":26.2124007,"lng":78.1772053}},"name":"Gwalior"}
/// status : "OK"

class PlaceDetailResponse {
  PlaceDetailResponse({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  PlaceDetailResponse.fromJson(dynamic json) {
    result = json['result'] != null
        ? PlaceResultFromId.fromJson(json['result'])
        : null;
    status = json['status'];
  }

  List<dynamic>? htmlAttributions;
  PlaceResultFromId? result;
  String? status;

  PlaceDetailResponse copyWith({
    List<dynamic>? htmlAttributions,
    PlaceResultFromId? result,
    String? status,
  }) =>
      PlaceDetailResponse(
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (htmlAttributions != null) {
      map['html_attributions'] =
          htmlAttributions?.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

/// formatted_address : "Gwalior, Madhya Pradesh, India"
/// geometry : {"location":{"lat":26.2124007,"lng":78.1772053}}
/// name : "Gwalior"

class PlaceResultFromId {
  PlaceResultFromId({
    this.formattedAddress,
    this.geometry,
    this.name,
  });

  PlaceResultFromId.fromJson(dynamic json) {
    formattedAddress = json['formatted_address'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    name = json['name'];
  }

  String? formattedAddress;
  Geometry? geometry;
  String? name;

  PlaceResultFromId copyWith({
    String? formattedAddress,
    Geometry? geometry,
    String? name,
  }) =>
      PlaceResultFromId(
        formattedAddress: formattedAddress ?? this.formattedAddress,
        geometry: geometry ?? this.geometry,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['formatted_address'] = formattedAddress;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['name'] = name;
    return map;
  }
}

/// location : {"lat":26.2124007,"lng":78.1772053}

class Geometry {
  Geometry({this.location});

  Geometry.fromJson(dynamic json) {
    location = json['location'] != null
        ? PlaceLocation.fromJson(json['location'])
        : null;
  }

  PlaceLocation? location;

  Geometry copyWith({PlaceLocation? location}) => Geometry(
        location: location ?? this.location,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }
}

/// lat : 26.2124007
/// lng : 78.1772053

class PlaceLocation {
  PlaceLocation({
    this.lat,
    this.lng,
  });

  PlaceLocation.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  double? lat;
  double? lng;

  PlaceLocation copyWith({
    double? lat,
    double? lng,
  }) =>
      PlaceLocation(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
