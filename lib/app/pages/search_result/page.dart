import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/widgets/util/cached_image.dart';
import '../../../resources/resources.dart';
import '../../widgets/util/tap_well.dart';
import 'controller.dart';
import 'widget/item_list_view.dart';
import 'widget/keyword_chip.dart';
import 'widget/summary_section.dart';

class SearchResultScreen extends GetView<SearchResultController> {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: controller.food.value.isGood
                    ? [
                        PickItColors.c00FF22,
                        PickItColors.c00461B,
                      ]
                    : [
                        PickItColors.cFF0000,
                        PickItColors.c460000,
                      ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            PickItColors.c000000.withOpacity(0.6),
                            PickItColors.c000000,
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: CachedImage(
                        url: controller.food.value.imgUrl,
                        width: double.infinity,
                        height: 442.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TapWell(
                            onTap: Get.back,
                            child: SvgPicture.asset(
                              Svgs.icLeftArrow,
                              height: 24.w,
                            ),
                          ),
                          Text(
                            controller.food.value.name,
                            style: PickItTextTheme.bodyBD16Regular
                                .copyWith(color: PickItColors.c121212),
                          ),
                          TapWell(
                            onTap: Get.back,
                            child: SvgPicture.asset(
                              Svgs.icSearch,
                              height: 24.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50.w,
                      right: 3.5.w,
                      child: Image.asset(
                        controller.food.value.isGood
                            ? Images.imgGoodEmoji
                            : Images.imgBadEmoji,
                        width: 227.w,
                      ),
                    ),
                    Positioned(
                        bottom: 30.w, left: 16.w, child: _topInfoSection()),
                  ],
                ),
                SizedBox(
                  height: 8.w,
                ),
                _bgSection(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Summary",
                        style: PickItTextTheme.bodyBD18Semibold
                            .copyWith(color: PickItColors.c121212),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.w),
                        child: Text(
                          controller.food.value.desc,
                          style: PickItTextTheme.bodyBD16Regular
                              .copyWith(color: PickItColors.c121212),
                        ),
                      ),
                      SummerySection(
                        imojiText: "🐷",
                        title: "before I eat bacon",
                        body: "EatBacon fsfsdsfs asdgaasdg",
                        isStartAlign: true,
                      ),
                      SizedBox(
                        height: 26.w,
                      ),
                      SummerySection(
                        imojiText: "d",
                        title: "before I eat bacon",
                        body: "EatBacon fsfsdsfs asdgaasdg",
                        isStartAlign: false,
                      )
                    ],
                  ),
                ),
                _bgSection(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TIP",
                      style: PickItTextTheme.bodyBD18Semibold.copyWith(
                        color: PickItColors.c121212,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Text(
                        controller.food.value.desc,
                        style: PickItTextTheme.bodyBD16Regular
                            .copyWith(color: PickItColors.c121212),
                      ),
                    ),
                    ...List.generate(
                        3,
                        (idx) => Padding(
                              padding: EdgeInsets.only(
                                top: idx == 0 ? 0 : 44.w,
                              ),
                              child: SummarySectionWithNum(
                                  idx: idx, title: "fdsf", body: "fdfs"),
                            ))
                  ],
                )),
                _bgSection(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommendation",
                        style: PickItTextTheme.bodyBD18Semibold
                            .copyWith(color: PickItColors.c121212),
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      PickItItemListView(
                        foods: [
                          controller.food.value,
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 57.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Svgs.lovely,
              width: 24.w,
              height: 24.w,
              color: PickItColors.cFFFFFF,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              controller.food.value.name,
              style: PickItTextTheme.bodyBD30Medium.copyWith(
                color: PickItColors.cFFFFFF,
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.w,
        ),
        Wrap(
          children: List.generate(
            controller.food.value.nutrients.length,
            (idx) => Padding(
              padding: EdgeInsets.only(left: idx == 0 ? 0 : 8.w),
              child: controller.food.value.isGood
                  ? KeywordChip.green(
                      controller.food.value.nutrients[idx],
                      idx: idx,
                    )
                  : KeywordChip.red(controller.food.value.nutrients[idx]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bgSection(Widget childWidget) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 28.w,
        vertical: 28.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: PickItColors.cFFFFFF,
      ),
      child: childWidget,
    );
  }
}
