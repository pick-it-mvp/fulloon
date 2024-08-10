import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/core/theme/global_text_util.dart';
import 'package:juction/app/data/provider/pickit_rest_api_client.dart';

import '../../data/models/food/food.dart';

class SearchResultController extends GetxController with GetTickerProviderStateMixin {
  static SearchResultController get to => Get.find<SearchResultController>(); // add this line
  final id = Get.arguments['id'] ?? -1;
  final List<String> emojis = ["🐷", "🐔", "🐟", "🍔", "🍕", "🍣", "🍜", "🍝"];
  Rx<Food?> food = Rxn(null);
  final RestApiClient restApiClient = RestApiClient();
  late final ScrollController scrollController;

  late final AnimationController colorAnimationController;
  late final Animation colorTween;
  late final Animation appBarTextTween;

  Future<void> search({required int id}) async {
    food.value = await restApiClient.getSearchResult(id, search: true);
  }

  /// ### 스크롤시 앱바의 색상을 투명 -> 검은색으로 바꿔주기 위한 이벤트 리스너
  bool scrollListener() {
    colorAnimationController.animateTo(scrollController.position.pixels / 208.w);
    return true;
  }

  void setAppBarDark() {
    scrollController = ScrollController()..addListener(scrollListener);

    colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    // 색상 설정, 투명 -> 검정
    colorTween = ColorTween(
      begin: Colors.transparent,
      end: PickItColors.cFFFFFF,
    ).animate(colorAnimationController);
    appBarTextTween = ColorTween(
      begin: Colors.transparent,
      end: PickItColors.cFFFFFF,
    ).animate(colorAnimationController);
  }

  @override
  void onInit() async {
    super.onInit();
    setAppBarDark();
    await search(id: id);
  }
}
