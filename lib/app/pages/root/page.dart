import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/root/controller.dart';
import 'package:juction/resources/resources.dart';

class RootPage extends GetView<RootPageController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Svgs.fulloon),
            const SizedBox(height: 24),
            Text("21주 산모님\n어떤 음식을\n드시고 싶으세요?", style: PickItTextTheme.bodyBD03Regular.copyWith(color: PickItColors.primaryColor)),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(33.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextField(
                controller: controller.searchTextController,
                cursorColor: PickItColors.primaryColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(24),
                  hintText: "",
                  hintStyle: PickItTextTheme.bodyBD02Regular.copyWith(color: PickItColors.primaryColor),
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
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
            )
          ],
        ),
      )),
    );
  }
}
