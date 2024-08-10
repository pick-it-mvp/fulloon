import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';

class KeywordChip extends StatelessWidget {
  final String keyword;
  final EdgeInsets padding;
  final Color bgColor;
  final Color borderColor;
  final TextStyle textStyle;
  final bool isFirst;

  const KeywordChip(
      {super.key,
      required this.keyword,
      required this.padding,
      required this.bgColor,
      required this.textStyle,
      required this.borderColor,
      this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w).copyWith(
        left: isFirst ? 0 : 2.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: padding,
      child: Text(
        keyword,
        style: textStyle,
      ),
    );
  }

  factory KeywordChip.red(String keyword) {
    return KeywordChip(
      keyword: keyword,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.w,
      ),
      bgColor: Colors.transparent,
      textStyle: PickItTextTheme.bodyBD10Medium.copyWith(
        fontWeight: FontWeight.w600,
        color: PickItColors.cFF0000,
      ),
      borderColor: PickItColors.cFF0000,
    );
  }

  factory KeywordChip.green(String keyword, {required int idx}) {
    return KeywordChip(
      keyword: keyword,
      padding: EdgeInsets.symmetric(
        horizontal: 7.5.w,
        vertical: 5.w,
      ),
      bgColor: Colors.transparent,
      textStyle: PickItTextTheme.bodyBD10Medium.copyWith(
          fontWeight: FontWeight.w600,
          color: PickItColors.c00A000,
          fontSize: 9.sp),
      borderColor: PickItColors.c00A000,
      isFirst: idx == 0,
    );
  }
}
