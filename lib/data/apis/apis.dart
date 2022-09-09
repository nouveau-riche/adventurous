import 'dart:io';
import 'dart:convert';

import 'package:adventurous_learner_app/data/modals/add_visited_location/search_location_response.dart';
import 'package:adventurous_learner_app/data/modals/profile/user_detail_response.dart';
import 'package:adventurous_learner_app/data/modals/profile/visited_location_response.dart';
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
    int skip,
    int limit,
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
      constant.paramSkip: skip,
      constant.paramLimit: limit,
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

  Future<UserDetailResponse?> getUserProfile(String token) async {
    final request = utils.createPostRequest(constant.getUserProfileUrl);

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return UserDetailResponse.fromJson(jsonDecode(data));
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

  Future<VisitedLocationResponse?> getUserLocation(String token) async {
    final request = utils.createPostRequest(constant.getUserLocationUrl);

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramSkip: 0,
      constant.paramLimit: 50,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return VisitedLocationResponse.fromJson(jsonDecode(data));
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

  Future<BaseResponse?> addPlace({
    required String token,
    required String locationName,
    required String address,
    required String email,
    required String name,
    required String contactNo,
    required String countryCode,
    required String websiteLink,
    required String description,
    required String learningOpportunity,
  }) async {
    final request = utils.createPostRequest(constant.addPlaceUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramAddress: address,
      constant.paramName: name,
      constant.paramContactNo: contactNo,
      constant.paramCountryCode: countryCode,
      constant.paramWebsite: websiteLink,
      constant.paramDescription: description,
      constant.paramLearningOpportunity: learningOpportunity,
      constant.paramLocation: {
        "type": "Point",
        "coordinates": [76.347904, 26.917148],
      },
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 201) {
        final data = await response.stream.bytesToString();
        printLog(data);
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

  Future<BaseResponse?> updateNameAndBio({
    required String token,
    required String location,
    required String name,
    required String bio,
  }) async {
    final request = utils.createPostRequest(constant.updateProfileUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramName: name,
      constant.paramBio: bio,
      constant.paramAddress: location,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
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

  Future<CheckEmailRegisterResponse?> checkEmailExists({
    required String token,
    required String email,
  }) async {
    final request = utils.createPostRequest(constant.emailExistsUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {constant.paramNewEmail: email};

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

  Future<CheckEmailRegisterResponse?> updateEmail({
    required String token,
    required String email,
    required String otp,
  }) async {
    final request = utils.createPostRequest(constant.updateEmailUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramNewEmail: email,
      constant.paramOtp: otp,
    };

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

  Future<bool> addLocationForYourself({
    required String type,
    required String address,
    required String name,
    required String contactNo,
    required String countryCode,
    required String website,
    required String description,
    required String learningOpp,
    required String email,
    required String yourName,
    required int rating,
    required String text,
    required String token,
    required List<File> images,
  }) async {
    FormData body = FormData.fromMap({
      constant.paramType: type,
      constant.paramAddress: address,
      constant.paramName: name,
      constant.paramContactNo: contactNo,
      constant.paramCountryCode: countryCode,
      constant.paramWebsite: website,
      constant.paramDescription: description,
      constant.paramLearningOpportunity: learningOpp,
      if (email.isNotEmpty) constant.paramContactEmail: email,
      if (name.isNotEmpty) constant.paramContactName: name,
      if (text.isNotEmpty) constant.paramText: text,
      if (rating != 0) constant.paramRating: rating.toString(),
    });

    if (images.isNotEmpty) {
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
    }

    try {
      final request = await Dio().post(
        constant.addUserLocationForEveryoneUrl,
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
      printLog(e.toString());
      showSnackBar('Check you internet', isError: true);
      return false;
    }
  }

  Future<bool> addVisitedLocation({
    required String token,
    required String locationId,
  }) async {
    final request = utils.createPostRequest(constant.addVisitedLocationUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {constant.paramLocationId: locationId};

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 201) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return true;
      } else {
        printLog(response.reasonPhrase);
        final data = await response.stream.bytesToString();
        showSnackBar(
          BaseResponse.fromJson(jsonDecode(data)).description ?? '',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      printLog(e);
      return false;
    }
  }

  Future<SearchLocationResponse?> searchLocation({
    required String token,
    required String query,
  }) async {
    final request = utils.createPostRequest(constant.searchLocationUrl);

    request.headers.clear();

    request.headers.addAll({
      'Content-Type': 'application/json',
      'x-access-token': token,
    });

    Map<String, dynamic> body = {
      constant.paramSkip: 0,
      constant.paramLimit: 20,
      constant.paramSearch: query,
    };

    utils.addBodyToRequest(request, body);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return SearchLocationResponse.fromJson(jsonDecode(data));
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

  Future<bool> updateImage({required File image, required String token}) async {
    FormData body = FormData.fromMap({
      constant.paramPhoto: await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });

    try {
      final request = await Dio().post(
        constant.updateProfileImageUrl,
        data: body,
        options: Options(headers: {"x-access-token": token}),
      );

      if (request.statusCode == 200) {
        showSnackBar('Profile Image Updated!');
        return true;
      } else {
        showSnackBar('Something went wrong', isError: true);
        return false;
      }
    } catch (e) {
      printLog(e.toString());
      showSnackBar('Check you internet', isError: true);
      return false;
    }
  }
}
