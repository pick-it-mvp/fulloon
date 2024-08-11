import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  static LoginPageController get to => Get.find<LoginPageController>(); // add this line

  final _email = ''.obs;
  final _password = ''.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
