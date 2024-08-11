import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/onboarding/controller.dart';
import 'package:juction/resources/resources.dart';

class OnboardingPage extends GetView<OnboardingPageController> {
  const OnboardingPage({super.key});

  Widget _textfield() {
    return Obx(
      () => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffc4c4c4),
              borderRadius: BorderRadius.circular(33.5),
            ),
            child: TextField(
              controller: controller.textEditingController,
              onEditingComplete: controller.nextPage,
              cursorColor: Colors.white,
              style: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(24),
                hintText: "Enter your ${controller.currentPageName}",
                hintStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                labelStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.5),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.5),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          if (controller.currentPage.value == 2)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Obx(() => Text(controller.subPageName, style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffc4c4c4),
                    borderRadius: BorderRadius.circular(33.5),
                  ),
                  child: TextField(
                    controller: controller.subTextEditingController,
                    onEditingComplete: controller.nextPage,
                    cursorColor: Colors.white,
                    style: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(24),
                      hintText: "Enter your ${controller.subPageName}",
                      hintStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                      labelStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Svgs.fulloonColor),
            const SizedBox(height: 80),
            Obx(() {
              if (controller.currentPage.value == 0) {
                return Column(
                  children: [
                    Text("Welcome to Fullon!", style: PickItTextTheme.bodyBD24Semibold),
                    const SizedBox(height: 80),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Text("Hello! ${controller.name.value}", style: PickItTextTheme.bodyBD24Semibold),
                    const SizedBox(height: 80),
                  ],
                );
              }
            }),
            Obx(() => Text(controller.currentPageName, style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
            const SizedBox(height: 16),
            _textfield(),
          ],
        ),
      )),
    );
  }
}
