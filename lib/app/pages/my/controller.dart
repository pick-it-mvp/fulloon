import 'package:get/get.dart';

class MyPageController extends GetxController with StateMixin {
  static MyPageController get to => Get.find<MyPageController>(); // add this line
}
