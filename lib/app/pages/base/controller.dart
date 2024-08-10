import 'package:get/get.dart';

class BasePageController extends GetxController with StateMixin {
  static BasePageController get to => Get.find<BasePageController>(); // add this line
}
