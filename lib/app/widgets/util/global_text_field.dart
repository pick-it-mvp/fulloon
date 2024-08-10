import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/color_theme.dart';
import '../../core/theme/global_text_styles.dart';


///* global textfield
class GlobalTextField extends StatelessWidget {
  final Function(String) onSubmitSearch;
  final VoidCallback? onEditComplete;
  final Function(String)? onChange;
  final VoidCallback? clearText;
  final FocusNode focusNode;
  final TextEditingController searchTextController;
  final Function(String)? onTapSearch;
  final Widget? prefix;
  final Widget? suffix;
  final Color backgroundColor;
  final String placeholderMsg;
  final TextStyle searchTextStyle;
  final TextStyle placeholderStyle;
  final double? height;

  const GlobalTextField({
    super.key,
    required this.onSubmitSearch,
    this.onEditComplete,
    this.onChange,
    this.clearText,
    required this.focusNode,
    required this.searchTextController,
    this.onTapSearch,
    required this.backgroundColor,
    required this.placeholderMsg,
    this.height,
    this.prefix,
    this.suffix,
    required this.searchTextStyle,
    required this.placeholderStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: focusNode,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      keyboardType: TextInputType.text,
      style: searchTextStyle,
      placeholder: placeholderMsg,
      placeholderStyle: placeholderStyle,
      prefixMode: OverlayVisibilityMode.editing,
      prefix: prefix,
      suffixMode: OverlayVisibilityMode.notEditing,
      suffix: suffix,
      onSubmitted: (value) => onSubmitSearch,
      onChanged: (value) => onChange,
    );
  }

  ///<h2>상호 미체험 테마 결과 화면 검색 field
  factory GlobalTextField.search({
    required TextEditingController searchTextController,
    required FocusNode focusNode,
    required Function(String) onSubmitSearch,
  }) {
    return GlobalTextField(
      searchTextController: searchTextController,
      focusNode: focusNode,
      onSubmitSearch: onSubmitSearch,
      backgroundColor: PickItColors.c353535,
      placeholderMsg: "테마명을 입력해주세요",
      searchTextStyle: PickItTextTheme.bodyBD02Bold,
      placeholderStyle: PickItTextTheme.bodyBD02Bold,
    );
  }
}
