import 'package:get/get.dart';
import 'package:juction/app/pages/question/controller.dart';

class QuestionPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionPageController>(() => QuestionPageController());
  }
}
