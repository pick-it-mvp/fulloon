import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/widgets/util/cached_image.dart';

import '../../data/models/food/food.dart';
import 'keyword_chip.dart';

class PickItItemListView extends StatelessWidget {
  final String title;
  final List<Food> foods;

  const PickItItemListView({
    super.key,
    required this.title,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle();
    final itemStyle = TextStyle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: style),
        SizedBox(
          height: 168.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (_, idx) {
              final food = foods[idx];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    CachedImage(
                      url: food.imgUrl,
                      width: 120.w,
                      height: 120.w,
                    ),
                    Text(
                      food.name,
                      style: itemStyle,
                    ),
                    //TODO: HARDCODING
                    Wrap(
                      children: List.generate(
                        food.nutrients.length,
                        (idx) => KeywordChip.nutrient(food.nutrients[idx]),
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
