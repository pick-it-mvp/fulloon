import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/question/controller.dart';
import 'package:juction/resources/resources.dart';

class QuestionDetailPage extends GetView<QuestionPageController> {
  const QuestionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Question",
          style: PickItTextTheme.bodyBD18Medium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchCard(svg_file: Svgs.chartNetwork, title: "AI"),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6f6f6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Svgs.chartNetwork),
                          const SizedBox(width: 8),
                          Text("AI", style: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text("Since pregnant women eat cheese, it has a risk of eating cheese, so far.But every cheese is not...",
                          style: PickItTextTheme.bodyBD12Regular),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF7FB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Svgs.userShield),
                          const SizedBox(width: 8),
                          Text("Specialist", style: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text("Since pregnant women eat cheese, it has a risk of eating cheese, so far.But every cheese is not...",
                          style: PickItTextTheme.bodyBD12Regular),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.svg_file,
    required this.title,
  });

  final String svg_file;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Sky Mommy · ", style: PickItTextTheme.bodyBD14Medium),
                        Text("28W", style: PickItTextTheme.bodyBD12Regular.copyWith(color: PickItColors.primaryColor)),
                      ],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    SizedBox(width: 16, height: 16, child: SvgPicture.asset(svg_file)),
                    const SizedBox(width: 8),
                    Text(title, style: PickItTextTheme.bodyBD16Medium.copyWith(color: PickItColors.primaryColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text("What is the best food for your health?", style: PickItTextTheme.bodyBD16Medium),
            const SizedBox(height: 8),
            Text(
              "Since pregnant women eat cheese, it has a risk of eating cheese, so far. But every cheese is not...",
              style: PickItTextTheme.bodyBD12Regular,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SvgPicture.asset(Svgs.eye),
                  const SizedBox(width: 4),
                  Text("42,452", style: PickItTextTheme.bodyBD10Regular.copyWith(color: PickItColors.primaryColor)),
                  const SizedBox(width: 4),
                  SvgPicture.asset(Svgs.like),
                  const SizedBox(width: 4),
                  Text("3,523", style: PickItTextTheme.bodyBD10Regular.copyWith(color: PickItColors.primaryColor)),
                ]),
                Text("2024.10.10 ", style: PickItTextTheme.bodyBD10Medium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
