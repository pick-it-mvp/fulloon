import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/widgets/util/tap_well.dart';


///* text가 중앙에 들어가는 globlal 버튼
class GlobalTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget content;
  final Color? activeBgColor;
  final Color? inActiveBgColor;
  final Color? borderColor;
  final bool isActive;
  final int verticalPadding;
  final int height;

  const GlobalTextButton({
    super.key,
    required this.onPressed,
    required this.content,
    required this.isActive,
    this.activeBgColor = _activeBgColor,
    this.inActiveBgColor = _inActiveBgColor,
    this.borderColor,
    required this.verticalPadding,
    this.height = 52,
  });

  static const _activeBgColor = PickItColors.cE1FE70;
  static const _inActiveBgColor = PickItColors.c353535;

  static const _activeTextColor = PickItColors.c000000;
  static const _inActiveTextColor = PickItColors.cE1FE70;


  @override
  Widget build(BuildContext context) {
    return TapWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height?.w,
        padding: EdgeInsets.symmetric(vertical: verticalPadding.w),
        decoration: BoxDecoration(
          color: isActive ? activeBgColor?.withOpacity(0.8) : inActiveBgColor,
          borderRadius: BorderRadius.circular(8),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        alignment: Alignment.center,
        child: content,
      ),
    );
  }

  factory GlobalTextButton.text({
    String text = '다음',
    required VoidCallback onPressed,
    required bool isActive,
    required TextStyle textStyle,
    Color activeTextColor = _activeTextColor,
    Color inActiveTextColor = _inActiveTextColor,
    Color? borderColor,
  }) {
    return GlobalTextButton(
      onPressed: onPressed,
      content: Text(
        text,
        style: textStyle.copyWith(
          color: isActive ? activeTextColor : inActiveTextColor,
        ),
      ),
      isActive: isActive,
      verticalPadding: 17,
    );
  }

}
