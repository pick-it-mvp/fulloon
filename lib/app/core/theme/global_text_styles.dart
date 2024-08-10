import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _defaultTextColor = Color(0xFFE3E3E3);
//TODO: font family 사용하는걸로 변경
const _defaultFontFamily = 'Pretendard';

class PickItTextTheme {
  PickItTextTheme._();

  static final bodyBD01Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.52,
  );
  static final bodyBD02Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static final bodyBD02Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.48,
  );

  static final TextStyle bodyBD03Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.04,
  );
}
