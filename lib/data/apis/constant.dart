class ApiConstants {
  Map<String, String> getHeader() => {'Content-Type': 'application/json'};

  Map<String, String> getHeaderFormData = {
    "Content-Type": "application/x-www-form-urlencoded",
  };

  //Old Base URL
  //final baseUrl = "http://68.178.202.229:3000/api/v1/";

  //New Base URL  (PROD) -- > USE THIS FOR PRODUCTION
  final baseUrl = "https://api.theadventurouslearner.com/api/v1/";

  //NEW BASE URL (DEV)
  //final baseUrl = "http://82.180.160.159:3006/api/v1";

  // final baseUrl = "https://adventurelearner.herokuapp.com/api/v1/";

  final googleMapsBaseUrl = 'https://maps.googleapis.com/maps/api/';

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

  String get getUserProfileUrl => '${baseUrl}app/get-user-profile';

  String get addPlaceUrl => '${baseUrl}suggest-location/create';

  String get updateProfileUrl => '${baseUrl}app/update-profile';

  String get emailExistsUrl => '${baseUrl}app/email-exist';

  String get updateEmailUrl => '${baseUrl}app/change-email';

  String get getUserLocationUrl => '${baseUrl}visited-location/list';

  String get addUserLocationForEveryoneUrl => '${baseUrl}user-location/create';

  String get addVisitedLocationUrl => '${baseUrl}visited-location/add';

  String get searchLocationUrl => '${baseUrl}location/search';

  String get updateProfileImageUrl => '${baseUrl}app/update-profile-image';

  String get getContactDetailsUrl => '${baseUrl}contact/get';

  String get getLearningModuleUrl => '${baseUrl}module/get';

  String get getNotificationUrl => '${baseUrl}notification/get-notifications';

  String get getFilterStateAndTagsUrl => '${baseUrl}location/get-tags-and-state';

  String get searchFilterStateAndTagsUrl => '${baseUrl}location/search-website-tags';


  final tagHomeScreenContent = 'HOME';

  final paramUserEmail = 'user_email';
  final paramName = 'name';
  final paramNewEmail = 'new_email';
  final paramBio = 'bio';
  final paramOtp = 'otp';
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
  final paramPhoto = 'photo';
  final paramType = 'type';
  final paramSkip = 'skip';
  final paramLimit = 'limit';
  final paramAddress = 'address';
  final paramContactNo = 'contactNo';
  final paramCountryCode = 'countryCode';
  final paramWebsite = 'websiteLink';
  final paramDescription = 'description';
  final paramLearningOpportunity = 'learningOpportunity';
  final paramLocation = "location";
  final paramSearch = "search";
  final paramContactName = "contactName";
  final paramContactEmail = "contactEmail";
  final paramPlayerId = "playerID";
  final paramDeviceOs = "deviceOS";
  final paramCreatedBy = "createdBy";
  final paramCreatedByName = "createdByName";
}
