import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/color_theme.dart';

///* skeleton container
class ContainerSkeleton extends StatelessWidget {
  final EdgeInsets? padding;
  final int? width;
  final int? height;

  const ContainerSkeleton(
      {super.key, this.padding, this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: PickItColors.c434343,
      borderRadius: BorderRadius.circular(4.w),
    );

    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      // width: double.infinity,
      child: Shimmer.fromColors(
        baseColor:  PickItColors.c434343,
        highlightColor:  PickItColors.c555555,
        enabled: true,
        child: Container(
          margin: EdgeInsets.only(right: 10.w),
          child: Container(
            decoration: decoration,
            width: width?.w ?? double.infinity,
            height: height?.w,
          ),
        ),
      ),
    );
  }
}
