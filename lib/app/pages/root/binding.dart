import 'package:get/get.dart';
import 'package:juction/app/pages/home/controller.dart';
import 'package:juction/app/pages/my/controller.dart';
import 'package:juction/app/pages/root/controller.dart';

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootPageController>(() => RootPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());

    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}
