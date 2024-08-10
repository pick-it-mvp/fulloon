import 'package:get/get.dart';

class AuthService extends GetxService {
  final Rx<String?> _accessToken = Rx<String?>(null);
  final Rx<String?> _refreshToken = Rx<String?>(null);

  String? get accessToken => _accessToken.value;
  String? get refreshToken => _refreshToken.value;

  Future<AuthService> init() async {
    _accessToken.value =
        "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlck1vZGUiOiJiYWJ5IiwicHJvdmlkZXIiOiJDVVNUT00iLCJlbWFpbCI6ImN1c3RvbTBAY3VzdG9tLmNvbSIsImlhdCI6MTcyMzMxMDMwNCwiZXhwIjoxNzIzOTE1MTA0fQ.ngfaM09OKz5v-3kPnBGK06QJ_2SWio8-uAYzHUl7xZYCZ_dsgOjhODFFlIn04qnLTazSV-vnwz8PcUwMsctJGQ";
    return this;
  }

  // TODO implement auth service
}
