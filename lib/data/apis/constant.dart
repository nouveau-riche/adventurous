class ApiConstants {
  Map<String, String> getHeader() => {'Content-Type': 'application/json'};

  final testUrl = "";
  final baseUrl = "https://adventurelearner.herokuapp.com/api/v1/app/";

  String get checkEmailRegisterUrl => '${baseUrl}user-email-register';

  String get registerUserUrl => '${baseUrl}create-user';

  String get loginUserUrl => '${baseUrl}user-login';

  String get forgotPasswordUrl => '${baseUrl}forgot-password';

  String get updatePasswordUrl => '${baseUrl}update-password';

  final paramUserEmail = 'user_email';
  final paramName = 'name';
  final paramPassword = 'password';
  final paramNewPassword = 'newPassword';
}
