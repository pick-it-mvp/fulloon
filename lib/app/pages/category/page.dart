import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/data/environment.dart';
import 'package:juction/app/widgets/util/cached_image.dart';

import '../../../resources/resources.dart';
import '../../core/theme/global_text_styles.dart';
import '../../routes/route.dart';
import '../../widgets/util/tap_well.dart';
import 'controller.dart';

class CategorySelectPage extends GetView<CategorySelectController> {
  const CategorySelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PickItColors.cFFFFFF,

        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                _categoryAppbar(),
                SizedBox(
                  height: 15.w,
                ),
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : controller.categories.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                "해당 카테고리에서\n산모님이 드실수 있는 음식을 준비중이에요",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                if (controller.categories.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    width: double.infinity,
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      runSpacing: 15.w,
                      spacing: 15.w,
                      children: List.generate(
                        controller.categories.value.length,
                        (idx) => TapWell(
                          onTap: () => Get.toNamed(Routes.result, arguments: {
                            "id": controller.categories.value[idx].id
                          }),
                          child: SizedBox(
                            height: 140.w,
                            width: 109.w,
                            child: Column(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: 100.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: CachedImage(
                                    url: Environment.imgBaseUrl +
                                        (controller
                                                .categories.value[idx]!.image ??
                                            ""),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.w,
                                ),
                                Text(
                                  controller.categories.value[idx].name ?? "",
                                  style: PickItTextTheme.bodyBD14Medium
                                      .copyWith(color: PickItColors.c121212),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryAppbar() {
    return Container(
      color: PickItColors.cFFFFFF,
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
            controller.category.name,
            style: PickItTextTheme.bodyBD16Regular
                .copyWith(color: PickItColors.c121212),
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
