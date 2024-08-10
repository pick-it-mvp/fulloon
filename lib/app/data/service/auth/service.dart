import 'package:get/get.dart';

class AuthService extends GetxService {
  final Rx<String?> _accessToken = Rx<String?>(null);
  final Rx<String?> _refreshToken = Rx<String?>(null);

  String? get accessToken => _accessToken.value;
  String? get refreshToken => _refreshToken.value;

  Future<AuthService> init() async {
    // TODO implement init
    return this;
  }

  // TODO implement auth service
}
