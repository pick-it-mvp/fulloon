import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/widgets/util/cached_image.dart';

import '../../../data/environment.dart';
import '../../../data/models/food/food.dart';
import 'keyword_chip.dart';

class PickItItemListView extends StatelessWidget {
  final List<Food> foods;

  const PickItItemListView({
    super.key,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (_, idx) {
              final food = foods[idx];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w).copyWith(
                  left: idx == 0 ? 0 : 8.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CachedImage(
                        url: Environment.imgBaseUrl + food.image,
                        width: 86.w,
                        height: 86.w,
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Text(
                      food.name,
                      style: PickItTextTheme.bodyBD12Regular,
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    Wrap(
                      children: List.generate(
                        food.tags.length,
                        (idx) => KeywordChip.green(
                          food.tags[idx],
                          idx: idx,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
