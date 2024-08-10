import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';

class KeywordChip extends StatelessWidget {
  final String keyword;
  final EdgeInsets padding;
  final Color bgColor;
  final TextStyle textStyle;

  const KeywordChip({super.key, required this.keyword, required this.padding, required this.bgColor, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: padding,
      child: Text(
        keyword,
        style: textStyle,
      ),
    );
  }

  factory KeywordChip.nutrient(String keyword) {
    return KeywordChip(
      keyword: keyword,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 4.w,
      ),
      bgColor: PickItColors.c01B156,
      textStyle: PickItTextTheme.bodyBD12Bold.copyWith(
        color: PickItColors.cFFFFFF,
      ),
    );
  }
}
