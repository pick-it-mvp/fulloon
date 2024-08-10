import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/pages/base/controller.dart';

class BasePage extends GetView<BasePageController> {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello World!!!"),
          ],
        ),
      )),
    );
  }
}
