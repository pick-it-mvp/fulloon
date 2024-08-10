import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/widgets/util/tap_well.dart';

import '../../../resources/resources.dart';

///* global appbar
class GlobalAppBar extends AppBar {
  GlobalAppBar({
    super.key,
    super.leading,
    String? titleText,
    Color? titleColor,
    Widget? action,
    Color? backgroundColor,
  }) : super(
          centerTitle: false,
          title: (titleText != null)
              ? Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    height: 18 / 15,
                    color: titleColor ?? PickItColors.cFFFFFF,
                  ),
                )
              : null,
          actions: (action != null) ? [action] : null,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: 0.0,
          /*systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),*/
        );

  factory GlobalAppBar.basic({
    Key? key,
    String? title,
    String? leadingIcon,
    Function()? onTabBack,
    Color? backgroundColor,
  }) =>
      GlobalAppBar(
        key: key,
        backgroundColor: backgroundColor,
        leading: TapWell(
          onTap: () {
            if (onTabBack == null) {
              Get.back();
              return;
            }
            onTabBack.call();
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: SvgPicture.asset(
              leadingIcon ?? Svgs.ibtnBackArrow,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        titleText: title,
      );

  /// 오른쪽 영역에 widget이 있는 AppBar
  factory GlobalAppBar.withTrailing({
    Key? key,
    String? title,
    Color? titleColor,
    String? leadingIcon,
    Function()? onTabBack,
    required Widget trailing,
    Color? backgroundColor,
  }) =>
      GlobalAppBar(
        key: key,
        backgroundColor: backgroundColor,
        leading: TapWell(
          onTap: () {
            if (onTabBack == null) {
              Get.back();
              return;
            }
            onTabBack.call();
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: SvgPicture.asset(
              leadingIcon ?? Svgs.ibtnBackArrow,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        titleText: title,
        titleColor: titleColor,
        action: trailing,
      );

  factory GlobalAppBar.onlyTitle({
    Key? key,
    String? title,
    Color? backgroundColor,
  }) =>
      GlobalAppBar(
        key: key,
        backgroundColor: backgroundColor,
        titleText: title,
      );

  GlobalAppBar._customTitle({
    super.key,
    super.leading,
    super.centerTitle,
    super.title,
    Widget? action,
    Color? backgroundColor,
  }) : super(
          actions: (action != null) ? [action] : null,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: 0.0,
        );

  factory GlobalAppBar.customTitle({
    Key? key,
    required bool centerTitle,
    required Widget title,
    String? leadingIcon,
    Function()? onTabBack,
    Widget? trailing,
    Color? backgroundColor,
  }) =>
      GlobalAppBar._customTitle(
        key: key,
        centerTitle: centerTitle,
        title: title,
        leading: TapWell(
          onTap: () {
            if (onTabBack == null) {
              Get.back();
              return;
            }
            onTabBack.call();
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: SvgPicture.asset(
              leadingIcon ?? Svgs.ibtnBackArrow,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        action: trailing,
        backgroundColor: backgroundColor,
      );
}
