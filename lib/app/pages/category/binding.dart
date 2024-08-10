import 'package:get/get.dart';
import 'controller.dart';

class CategorySelectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategorySelectController>(() => CategorySelectController());
  }
}
