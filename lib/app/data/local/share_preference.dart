import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceKey {
  /// 서버에서 내려주는 사용자 엑세스 토큰
  static const userToken = 'userToken';
}

class SharedPreferenceStore {
  factory SharedPreferenceStore() => _instance;

  static final _instance = SharedPreferenceStore.private();

  late Future<SharedPreferences> _sharedPreferences;

  SharedPreferenceStore.private() {
    _sharedPreferences = _initSharedPreference();
  }

  Future<SharedPreferences> _initSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  /// 로그인시 토큰 발급
  Future<void> setUserToken(String token) async =>
      await (await _sharedPreferences)
          .setString(SharedPreferenceKey.userToken, token);

  Future<String?> getUserToken() async =>
      (await _sharedPreferences).getString(SharedPreferenceKey.userToken);
}
