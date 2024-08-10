import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/my/controller.dart';
import 'package:juction/resources/resources.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: SvgPicture.asset(Svgs.myText),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 10,
                      backgroundColor: Color(0xffF6F6F6),
                      valueColor: AlwaysStoppedAnimation<Color>(PickItColors.primaryColor),
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Velly", style: PickItTextTheme.bodyBD18Semibold),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: PickItColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("D-140", style: PickItTextTheme.bodyBD12Semibold.copyWith(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: PickItColors.primaryColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("A Date of Birth", style: PickItTextTheme.bodyBD12Regular),
                    const SizedBox(width: 8),
                    Container(width: 1, height: 12, color: PickItColors.primaryColor),
                    const SizedBox(width: 8),
                    Text("2025.05.01", style: PickItTextTheme.bodyBD12Semibold.copyWith(color: PickItColors.primaryColor)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.coin, width: 18),
                const SizedBox(width: 8),
                Text("1000", style: PickItTextTheme.bodyBD16Medium),
              ],
            ),
            const SizedBox(height: 36),
            Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24)), color: Color(0xffF6F6F6)),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: [Text("Edit Profile", style: PickItTextTheme.bodyBD16Medium), const Spacer(), SvgPicture.asset(Svgs.arrowRight)],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [Text("My Questions", style: PickItTextTheme.bodyBD16Medium), const Spacer(), SvgPicture.asset(Svgs.arrowRight)],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text("Helpful Information", style: PickItTextTheme.bodyBD16Medium),
                        const Spacer(),
                        SvgPicture.asset(Svgs.arrowRight)
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [Text("View My Quizzes", style: PickItTextTheme.bodyBD16Medium), const Spacer(), SvgPicture.asset(Svgs.arrowRight)],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
