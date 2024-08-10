import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/pages/Root/controller.dart';

class RootPage extends GetView<RootPageController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
