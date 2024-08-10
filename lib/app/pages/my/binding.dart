import 'package:get/get.dart';
import 'package:juction/app/pages/my/controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}
