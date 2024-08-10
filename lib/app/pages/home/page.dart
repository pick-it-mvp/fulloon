// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/home/controller.dart';
import 'package:juction/resources/resources.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  Widget _textfield() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(33.5),
      ),
      child: TextField(
        cursorColor: PickItColors.primaryColor,
        style: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(24),
          hintText: "Search",
          hintStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor),
          labelStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Images.background), fit: BoxFit.fitWidth)),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(Svgs.fulloon),
                  const SizedBox(height: 24),
                  _textfield(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            CategoryItem(svg_file: Svgs.menu, title: "Full View"),
                            CategoryItem(svg_file: Svgs.forkKnife, title: "School Food"),
                            CategoryItem(svg_file: Svgs.carrot, title: "Fruit"),
                            CategoryItem(svg_file: Svgs.lovely, title: "Meat"),
                            CategoryItem(svg_file: Svgs.fish, title: "Fish"),
                            CategoryItem(svg_file: Svgs.breadSlice, title: "Meal"),
                            CategoryItem(svg_file: Svgs.cheese, title: "Milk"),
                            CategoryItem(svg_file: Svgs.bowlHot, title: "Ramen"),
                            CategoryItem(svg_file: Svgs.iceCream, title: "Ice Cream"),
                            CategoryItem(svg_file: Svgs.martiniGlass, title: "Beverage"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Image.asset(Images.quizBanner),
                      const SizedBox(height: 24),
                      Text("💭 Question", style: PickItTextTheme.bodyBD18Semibold),
                      const SizedBox(height: 8),
                      Text("AI and professional specialists!", style: PickItTextTheme.bodyBD14Regular),
                      const SizedBox(height: 16),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            QuestionCard(svg_file: Svgs.chartNetwork, title: "AI"),
                            SizedBox(width: 16),
                            QuestionCard(svg_file: Svgs.userShield, title: "Specialist"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.svg_file,
    required this.title,
  });

  final String svg_file;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xfff5f5f5)),
          child: SvgPicture.asset(svg_file, width: 24, height: 24),
        ),
        const SizedBox(height: 4),
        Text(title, style: PickItTextTheme.bodyBD10Medium.copyWith(color: const Color(0xff626262))),
      ],
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.svg_file,
    required this.title,
  });

  final String svg_file;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 16, height: 16, child: SvgPicture.asset(svg_file)),
                    const SizedBox(width: 8),
                    Text(title, style: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor)),
                  ],
                ),
                const SizedBox(height: 16),
                Text("What is the best food for your health?", style: PickItTextTheme.bodyBD14Regular),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SvgPicture.asset(Svgs.eye),
                  const SizedBox(width: 4),
                  Text("42,452", style: PickItTextTheme.bodyBD10Regular.copyWith(color: PickItColors.primaryColor)),
                  const SizedBox(width: 4),
                  SvgPicture.asset(Svgs.like),
                  const SizedBox(width: 4),
                  Text("3,523", style: PickItTextTheme.bodyBD10Regular.copyWith(color: PickItColors.primaryColor)),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
