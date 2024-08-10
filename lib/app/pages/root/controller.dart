import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageController extends GetxController with StateMixin {
  static RootPageController get to => Get.find<RootPageController>(); // add this line

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchTextController = TextEditingController();
}
