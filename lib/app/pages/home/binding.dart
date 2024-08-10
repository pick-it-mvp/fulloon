import 'package:get/get.dart';
import 'package:juction/app/pages/home/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
