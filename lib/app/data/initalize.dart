import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:juction/app/data/service/auth/service.dart';

class AppInitalizer {
  Future<void> init() async {
    await Future.wait([
      Get.putAsync(() => AuthService().init()),
      dotenv.load(),
    ]);
  }
}
