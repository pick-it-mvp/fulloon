import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/pages/question/controller.dart';
import 'package:juction/resources/resources.dart';

class QuestionPage extends GetView<QuestionPageController> {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(Svgs.question),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: PickItColors.primaryColor,
        child: SvgPicture.asset(Svgs.edit),
      ),
      body: SafeArea(
          child: const Padding(
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
