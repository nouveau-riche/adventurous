// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  String? description;
  bool? status;
  List<String>? response;
  Map<String, String>? state;

  FilterModel({
    this.description,
    this.status,
    this.response,
    this.state,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    description: json["description"],
    status: json["status"],
    response: json["response"] == null ? [] : List<String>.from(json["response"]!.map((x) => x)),
    state: Map.from(json["state"]!).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "status": status,
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x)),
    "state": Map.from(state!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
