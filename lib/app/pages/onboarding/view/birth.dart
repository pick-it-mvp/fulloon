import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/onboarding/controller.dart';
import 'package:juction/resources/resources.dart';

class BirthPage extends GetView<OnboardingPageController> {
  const BirthPage({super.key});

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
            Text("Congratulations!", style: PickItTextTheme.bodyBD24Semibold),
            const SizedBox(height: 8),
            Text("Let me know you", style: PickItTextTheme.bodyBD24Semibold),
            const SizedBox(height: 80),
            Text("Are you currently giving birth?", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.nextPage3("Yes"),
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff121212)),
                          borderRadius: BorderRadius.circular(10),
                          color: controller.birth ? const Color(0xffd9d9d9) : const Color(0xffFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text("Yes", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.nextPage3("No"),
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff121212)),
                          borderRadius: BorderRadius.circular(10),
                          color: controller.notBirth ? const Color(0xffd9d9d9) : const Color(0xffFFFFFF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text("No", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Obx(() {
              if (controller.birth) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("When is your due date?", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
                    const SizedBox(height: 16),
                    Stack(
                      fit: StackFit.loose,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  useMagnifier: true,
                                  onSelectedItemChanged: controller.selectYear,
                                  itemExtent: 50,
                                  children: [
                                    for (var i = 2000; i < 2100; i++) Text('$i Year', style: PickItTextTheme.bodyBD16Medium),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: controller.selectMonth,
                                  itemExtent: 50,
                                  diameterRatio: 1.5,
                                  children: [
                                    for (var i = 1; i < 13; i++)
                                      Text(
                                        '$i Month',
                                        style: PickItTextTheme.bodyBD16Medium,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: controller.selectDay,
                                  itemExtent: 50,
                                  diameterRatio: 1.5,
                                  children: [
                                    for (var i = 1; i < 32; i++)
                                      Text(
                                        '$i Day',
                                        style: PickItTextTheme.bodyBD16Medium,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(border: Border.all(color: const Color(0xffd9d9d9)), borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (controller.notBirth) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("When did you give birth?", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
                    const SizedBox(height: 16),
                    Stack(
                      fit: StackFit.loose,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  useMagnifier: true,
                                  onSelectedItemChanged: controller.selectYear,
                                  itemExtent: 50,
                                  children: [
                                    for (var i = 2000; i < 2100; i++) Text('$i Year', style: PickItTextTheme.bodyBD16Medium),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: controller.selectMonth,
                                  itemExtent: 50,
                                  diameterRatio: 1.5,
                                  children: [
                                    for (var i = 1; i < 13; i++)
                                      Text(
                                        '$i Month',
                                        style: PickItTextTheme.bodyBD16Medium,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                child: ListWheelScrollView(
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: controller.selectDay,
                                  itemExtent: 50,
                                  diameterRatio: 1.5,
                                  children: [
                                    for (var i = 1; i < 32; i++)
                                      Text(
                                        '$i Day',
                                        style: PickItTextTheme.bodyBD16Medium,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(border: Border.all(color: const Color(0xffd9d9d9)), borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: controller.signUp,
              child: Container(
                decoration: BoxDecoration(
                  color: PickItColors.primaryColor,
                  borderRadius: BorderRadius.circular(33.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text("Sign Up", style: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
