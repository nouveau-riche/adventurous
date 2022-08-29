class ApiConstants {
  Map<String, String> getHeader() => {'Content-Type': 'application/json'};

  Map<String, String> getHeaderFormData = {
    "Content-Type": "application/x-www-form-urlencoded",
  };

  final baseUrl = "https://adventurelearner.herokuapp.com/api/v1/";
  final googleMapsBaseUrl = 'https://maps.googleapis.com/maps/api/';

  // api/v1/

  String get checkEmailRegisterUrl => '${baseUrl}app/user-email-register';

  String get registerUserUrl => '${baseUrl}app/create-user';

  String get loginUserUrl => '${baseUrl}app/user-login';

  String get forgotPasswordUrl => '${baseUrl}app/forgot-password';

  String get updatePasswordUrl => '${baseUrl}app/update-password';

  String get getLocationDetailUrl => '${baseUrl}location/get-location';

  String get postReviewUrl => '${baseUrl}review/create';

  String get updateReviewRatingAndTextUrl => '${baseUrl}review/update';

  String get updateReviewImageUrl => '${baseUrl}review/upload-file';

  String get getPlaceDetailFromLatLongUrl => '${googleMapsBaseUrl}geocode/json';

  String get getHomeScreenContentUrl => '${baseUrl}content/get';

  final tagHomeScreenContent = 'HOME';

  final paramUserEmail = 'user_email';
  final paramName = 'name';
  final paramPassword = 'password';
  final paramNewPassword = 'newPassword';
  final paramLat = 'lat';
  final paramLong = 'long';
  final paramRadius = 'radius';
  final paramRating = 'rating';
  final paramText = 'text';
  final paramLocationId = 'locationId';
  final paramReviewId = 'reviewId';
  final paramKey = 'key';
  final paramLatLong = 'latlng';
  final paramImages = 'images';
  final paramType = 'type';
}
