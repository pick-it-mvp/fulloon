import 'package:get/get.dart';
import 'package:juction/app/pages/onboarding/controller.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingPageController>(() => OnboardingPageController());
  }
}
