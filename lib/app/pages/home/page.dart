import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/global_logger.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/home/controller.dart';
import 'package:juction/app/routes/route.dart';
import 'package:juction/app/widgets/util/tap_well.dart';
import 'package:juction/resources/resources.dart';

import '../../data/models/search/search.dart';
import '../root/controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  Widget _textfield() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(33.5),
      ),
      child: TextField(
        onSubmitted: (val) => controller.getSearchResult(null, false),
        controller: controller.textEditingController,
        onEditingComplete: controller.getKeywords,
        focusNode: controller.focusNode,
        cursorColor: PickItColors.primaryColor,
        style: PickItTextTheme.bodyBD16Medium
            .copyWith(color: PickItColors.primaryColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(24),
          hintText: "Search",
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.search, color: Colors.black),
          ),
          hintStyle: PickItTextTheme.bodyBD16Medium
              .copyWith(color: PickItColors.primaryColor),
          labelStyle: PickItTextTheme.bodyBD16Medium
              .copyWith(color: PickItColors.primaryColor),
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
    return GestureDetector(
      onTap: () {
        controller.clearSearchKeyword();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.background), fit: BoxFit.fitWidth)),
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Obx(() {
                      if (controller.isSearching.value) {
                        return _isSearching();
                      }
                      if (controller.isTyping) {
                        return _isTyping();
                      }

                      return _isNotSearching();
                    }),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Column _isTyping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Keyword", style: PickItTextTheme.bodyBD18Semibold),
        const SizedBox(height: 24),
        ListView.separated(
            shrinkWrap: true,
            itemCount: controller.searchKeywords.value.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final keyword = controller.searchKeywords.value[index];
              return TapWell(
                onTap: () async {
                  await controller.getSearchResult(keyword.id, true);
                },
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xff747474)),
                    const SizedBox(width: 12),
                    Text(keyword.name ?? "",
                        style: PickItTextTheme.bodyBD14Regular
                            .copyWith(color: const Color(0xff747474))),
                    const Spacer(),
                  ],
                ),
              );
            }),
      ],
    );
  }

  ///* 최근 검색어
  Column _isSearching() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent", style: PickItTextTheme.bodyBD18Semibold),
        const SizedBox(height: 24),
        Obx(
          () => ListView.separated(
              shrinkWrap: true,
              itemCount: controller.searchHistories.value.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                Map keyword = controller.searchHistories.value[index];
                return GestureDetector(

                  onTap: () => controller.getSearchResult(keyword["food"]["id"]),

                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xff747474)),
                      const SizedBox(width: 12),

                      Text("${keyword["food"]["name"]}", style: PickItTextTheme.bodyBD14Regular.copyWith(color: const Color(0xff747474))),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            controller.deleteSearchHistory(keyword.id);
                          },
                          child: Icon(Icons.close,
                              color: const Color(0xff747474))),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Column _isNotSearching() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              Category.values.length,
              (idx) => CategoryItem(
                svg_file: Category.values[idx].iconUrl,
                title: Category.values[idx].name,
                getSearch: () => Get.toNamed(
                  Routes.category,
                  arguments: Category.values[idx],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Image.asset(Images.quizBanner),
        const SizedBox(height: 24),
        TapWell(
          onTap: () => RootPageController.to.changePage(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("💭 Question", style: PickItTextTheme.bodyBD18Semibold),
                  SizedBox(height: 8.w),
                  Text("AI and professional specialists!",
                      style: PickItTextTheme.bodyBD14Regular),
                ],
              ),
              SvgPicture.asset(Svgs.icRightArrow)
            ],
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const QuestionCard(svg_file: Svgs.chartNetwork, title: "AI"),
              const SizedBox(width: 16),
              const QuestionCard(
                  svg_file: Svgs.userShield, title: "Specialist"),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.svg_file,
    required this.title,
    required this.getSearch,
  });

  final String svg_file;
  final String title;
  final VoidCallback getSearch;

  @override
  Widget build(BuildContext context) {
    return TapWell(
      onTap: getSearch,
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xfff5f5f5)),
            child: SvgPicture.asset(svg_file, width: 24, height: 24),
          ),
          const SizedBox(height: 4),
          Text(title,
              style: PickItTextTheme.bodyBD10Medium
                  .copyWith(color: const Color(0xff626262))),
        ],
      ),
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
                    SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(svg_file)),
                    const SizedBox(width: 8),
                    Text(title,
                        style: PickItTextTheme.bodyBD16Medium
                            .copyWith(color: PickItColors.primaryColor)),
                  ],
                ),
                const SizedBox(height: 16),
                Text("What is the best food for your health?",
                    style: PickItTextTheme.bodyBD14Regular),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SvgPicture.asset(Svgs.eye),
                  const SizedBox(width: 4),
                  Text("42,452",
                      style: PickItTextTheme.bodyBD10Regular
                          .copyWith(color: PickItColors.primaryColor)),
                  const SizedBox(width: 4),
                  SvgPicture.asset(Svgs.like),
                  const SizedBox(width: 4),
                  Text("3,523",
                      style: PickItTextTheme.bodyBD10Regular
                          .copyWith(color: PickItColors.primaryColor)),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
