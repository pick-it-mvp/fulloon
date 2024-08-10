import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/pages/home/page.dart';
import 'package:juction/app/pages/question/page.dart';

class RootPageController extends GetxController with StateMixin {
  static RootPageController get to => Get.find<RootPageController>(); // add this line

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  final _pages = ["/home", "/question", "/my"];

  List<Widget> pages = [
    const HomePage(),
    const QuestionPage(),
    Container(color: Colors.blue),
  ];

  void changePage(int index) {
    if (_pageIndex.value == index) return;
    if (_pages[index] == '') return;
    _pageIndex(index);
    //Get.offAllNamed(_pages[index], id: _navigatorKey);
  }
}
