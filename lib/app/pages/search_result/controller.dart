import 'package:get/get.dart';
import 'package:juction/app/core/theme/global_text_util.dart';

import '../../data/models/food/food.dart';

class SearchResultController extends GetxController with StateMixin {
  static SearchResultController get to =>
      Get.find<SearchResultController>(); // add this line
  //TODO:HARDCODING
  Rx<Food> food = Food(
      id: 1,
      name: "아몬드",
      isGood: true,
      desc: "아몬fdfdf드",
      imgUrl: GlobalTextUtil.defaultImgUrl,
      nutrients: ["단백질", "탄수", "지방"]).obs;
}
