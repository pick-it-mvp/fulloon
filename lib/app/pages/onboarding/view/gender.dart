import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/onboarding/controller.dart';
import 'package:juction/resources/resources.dart';

class GenderPage extends GetView<OnboardingPageController> {
  const GenderPage({super.key});

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
            Text("Gender", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.nextPage2("Woman"),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff121212)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("Woman", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.nextPage2("Man"),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff121212)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: Text("Man", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232)))),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
