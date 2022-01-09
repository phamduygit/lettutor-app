import 'package:shared_preferences/shared_preferences.dart';

class LocalSP {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> getAccessToken() async {
    final SharedPreferences prefs = await _prefs;
    final String accessToken = (prefs.getString('accessToken') ?? "");
    return accessToken;
  }
  Future<void> setAccessToken(String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("accessToken", value);
  }
}