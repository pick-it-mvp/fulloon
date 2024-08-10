import 'package:get/get.dart';
import 'package:juction/app/pages/base/controller.dart';

class BasePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasePageController>(() => BasePageController());
  }
}
