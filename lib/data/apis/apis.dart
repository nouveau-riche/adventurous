import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/data/apis/constant.dart';
import 'package:adventurous_learner_app/data/apis/utils.dart';
import 'package:adventurous_learner_app/data/modals/base_response.dart';
import 'package:adventurous_learner_app/data/modals/home/home_content_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/login_user_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/register_user_response.dart';
import 'package:adventurous_learner_app/data/modals/map/location_detail_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/forgot_password_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/check_email_register_response.dart';

class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();

  Future<CheckEmailRegisterResponse?> checkEmailRegister(String email) async {
    final request = utils.createPostRequest(constant.checkEmailRegisterUrl);

    Map<String, dynamic> body = {constant.paramUserEmail: email};

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return CheckEmailRegisterResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).message ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<RegisterUserResponse?> registerUser(
    String email,
    String name,
    String password,
  ) async {
    final request = utils.createPostRequest(constant.registerUserUrl);

    Map<String, dynamic> body = {
      constant.paramUserEmail: email,
      constant.paramName: name,
      constant.paramPassword: password,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 201) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return RegisterUserResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<LoginUserResponse?> loginUser(String email, String password) async {
    final request = utils.createPostRequest(constant.loginUserUrl);

    Map<String, dynamic> body = {
      constant.paramUserEmail: email,
      constant.paramPassword: password,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginUserResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<ForgotPasswordResponse?> forgotPassword(String email) async {
    final request = utils.createPostRequest(constant.forgotPasswordUrl);

    Map<String, dynamic> body = {constant.paramUserEmail: email};

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
        );
        return ForgotPasswordResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<BaseResponse?> updatePassword(
    String email,
    String password,
  ) async {
    final request = utils.createPostRequest(constant.updatePasswordUrl);

    Map<String, dynamic> body = {
      constant.paramUserEmail: email,
      constant.paramNewPassword: password,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).message ?? '',
        );
        return BaseResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<LocationDetailResponse?> getLocationDetails(
    double lat,
    double long,
    String token,
  ) async {
    final request = utils.createPostRequest(constant.getLocationDetailUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramLat: lat,
      constant.paramLong: long,
      constant.paramRadius: 60,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LocationDetailResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).message ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<bool> addRating(
    int rating,
    String review,
    String locationId,
    String token,
    List<File> images,
  ) async {
    FormData body = FormData.fromMap({
      constant.paramText: review,
      constant.paramRating: rating.toString(),
      constant.paramLocationId: locationId,
    });

    for (var file in images) {
      body.files.addAll([
        MapEntry(
          constant.paramImages,
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      ]);
    }

    try {
      final request = await Dio().post(
        constant.postReviewUrl,
        data: body,
        options: Options(headers: {"x-access-token": token}),
      );

      if (request.statusCode == 201) {
        return true;
      } else {
        showSnackBar('Something went wrong', isError: true);
        return false;
      }
    } catch (e) {
      showSnackBar('Check you internet', isError: true);
      return false;
    }
  }

  Future<HomeContentResponse?> getHomeScreenContent(String token) async {
    final request = utils.createPostRequest(constant.getHomeScreenContentUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramType: constant.tagHomeScreenContent,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return HomeContentResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).message ?? '',
          isError: true,
        );
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }
}
