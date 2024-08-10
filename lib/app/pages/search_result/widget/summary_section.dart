import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';

import '../../../../resources/resources.dart';

class SummerySection extends StatelessWidget {
  final String imojiText;
  final String title;
  final String body;
  final bool isStartAlign;

  const SummerySection({super.key, required this.imojiText, required this.title, required this.body, required this.isStartAlign});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PickItColors.cF6F6F6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: isStartAlign ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: PickItTextTheme.bodyBD16Medium.copyWith(
                    color: PickItColors.c121212,
                  ),
                ),
                SizedBox(height: 16.w),
                Container(
                  constraints: BoxConstraints(maxWidth: 217.w),
                  child: Text(
                    body,
                    style: PickItTextTheme.bodyBD12Regular.copyWith(
                      color: PickItColors.c121212,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -16.w,
            left: isStartAlign ? null : 24.w,
            right: isStartAlign ? 24.w : null,
            child: Container(
              height: 54.w,
              width: 54.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PickItColors.cFFFFFF,
              ),
              alignment: Alignment.center,
              child: Text(
                imojiText,
                style: TextStyle(fontSize: 29.sp, color: PickItColors.c121212),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummarySectionWithNum extends StatelessWidget {
  final int idx;
  final String title;
  final String body;

  const SummarySectionWithNum({
    super.key,
    required this.idx,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final imgUrl = switch (idx) {
      0 => Images.imgIndex1,
      1 => Images.imgIndex2,
      2 => Images.imgIndex3,
      _ => Images.imgIndex1,
    };

    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PickItColors.cF6F6F6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PickItTextTheme.bodyBD14SemiBold.copyWith(
                    color: PickItColors.c121212,
                  ),
                ),
                SizedBox(height: 4.w),
                Container(
                  constraints: BoxConstraints(maxWidth: 213.w),
                  child: Text(
                    body,
                    style: PickItTextTheme.bodyBD12Regular.copyWith(
                      color: PickItColors.c121212,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20.w,
            right: 17.w,
            child: Image.asset(
              imgUrl,
              width: 38.w,
              height: 69.w,
            ),
          ),
        ],
      ),
    );
  }
}
