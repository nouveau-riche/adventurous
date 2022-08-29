import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/data/apis/constant.dart';

class ApiUtils {
  final constant = ApiConstants();

  http.Request createGetRequest(String url) {
    final request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createGetRequestWithParams(
    String url,
    Map<String, dynamic> queryParams,
  ) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);

    final request = http.Request('GET', uri);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createPostRequest(String url) {
    final request = http.Request('POST', Uri.parse(url));
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createPostRequestWithParams(
    String url,
    Map<String, dynamic> queryParams,
  ) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);
    final request = http.Request('POST', uri);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createDeleteRequest(String url) {
    final request = http.Request('DELETE', Uri.parse(url));
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createDeleteRequestWithParams(
    String url,
    Map<String, dynamic> queryParams,
  ) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);

    final request = http.Request('DELETE', uri);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createPutRequest(String url) {
    final request = http.Request('PUT', Uri.parse(url));
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  http.Request createPutRequestWithParams(
    String url,
    Map<String, dynamic> queryParams,
  ) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);

    final request = http.Request('PUT', uri);
    request.headers.addAll(constant.getHeader());
    printLog(request);
    return request;
  }

  addBodyToRequest(http.Request request, Map<String, dynamic> body) {
    request.body = json.encode(body);
    printLog(request.body);
  }
}
