import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/question/controller.dart';
import 'package:juction/app/pages/question/view/detail.dart';
import 'package:juction/resources/resources.dart';

class QuestionPage extends GetView<QuestionPageController> {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(Svgs.question),
        centerTitle: false,
        backgroundColor: const Color(0xffFFF3F9),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: PickItColors.primaryColor,
        child: SvgPicture.asset(Svgs.edit),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              color: const Color(0xffFFF3F9),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🔥 Hot",
                      style: PickItTextTheme.bodyBD20Semibold,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const QuestionCard(svg_file: Svgs.chartNetwork, title: "AI"),
                          const SizedBox(width: 16),
                          const QuestionCard(svg_file: Svgs.userShield, title: "Specialist"),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("🔍 Search", style: PickItTextTheme.bodyBD20Semibold),
                      SvgPicture.asset(Svgs.arrowRight),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SearchCard(svg_file: Svgs.chartNetwork, title: "AI"),
                          const SizedBox(height: 16),
                          SearchCard(svg_file: Svgs.chartNetwork, title: "AI"),
                          const SizedBox(height: 16),
                          SearchCard(svg_file: Svgs.chartNetwork, title: "AI"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
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
    return GestureDetector(
      onTap: () => Get.to(() => const QuestionDetailPage()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}
