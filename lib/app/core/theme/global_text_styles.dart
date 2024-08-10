import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _defaultTextColor = Color(0xFF121212);
//TODO: font family 사용하는걸로 변경
const _defaultFontFamily = 'Pretendard';

class PickItTextTheme {
  PickItTextTheme._();

  static final bodyBD14Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.52,
  );
  static final bodyBD14Medium = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.52,
  );

  static final bodyBD12Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static final bodyBD12Semibold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.48,
  );
  static final bodyBD12Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.48,
  );

  static final TextStyle bodyBD40Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.04,
  );

  static final bodyBD18Semibold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.52,
  );
  static final bodyBD20Semibold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.52,
  );

  static final bodyBD16Medium = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.52,
  );

  static final bodyBD10Medium = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.52,
  );

  static final bodyBD10Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.52,
  );
}
