import 'package:shared_preferences/shared_preferences.dart';

import 'package:adventurous_learner_app/data/preferences/const.dart';

class PrefRepository {
  Future<SharedPreferences> _getPref() => SharedPreferences.getInstance();
  final _const = PrefConst();

  clearPreferences() async {
    (await _getPref()).clear();
  }

  setUserXAccessToken(String? value) async {
    (await _getPref()).setString(_const.userXAccessToken, value ?? "");
  }

  Future<String?> getUserXAccessToken() async {
    final data = (await _getPref()).getString(_const.userXAccessToken);
    if (data != null && data.isNotEmpty) {
      return data;
    } else {
      return null;
    }
  }
}
