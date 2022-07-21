class ApiConstants {
  final serviceKey = '';
  final clientId = '';

  Map<String, String> getHeader() => {
        'serviceKey': serviceKey,
        'clientId': clientId,
        'Content-Type': 'application/json',
      };

  final testUrl = "";
  final baseUrl = "";
}
