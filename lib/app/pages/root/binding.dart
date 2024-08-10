import 'package:get/get.dart';
import 'package:juction/app/pages/root/controller.dart';

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootPageController>(() => RootPageController());
  }
}
