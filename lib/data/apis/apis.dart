import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:adventurous_learner_app/utils/common.dart';
import 'package:adventurous_learner_app/data/apis/constant.dart';
import 'package:adventurous_learner_app/data/apis/utils.dart';
import 'package:adventurous_learner_app/data/modals/base_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/login_user_response.dart';
import 'package:adventurous_learner_app/data/modals/auth/register_user_response.dart';
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
}
