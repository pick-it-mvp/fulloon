import 'package:get/get.dart';

import '../../data/models/food/food.dart';

class SearchResultController extends GetxController with StateMixin {
  static SearchResultController get to =>
      Get.find<SearchResultController>(); // add this line
  RxList<Food> foods = <Food>[
    //TODO:HARDCODING
    Food(
        id: 1,
        name: "아몬드",
        imgUrl: "https://cdn.zamfit.kr/event/294.png",
        nutrients: ["단백질", "탄수", "지방"]),
    Food(
        id: 1,
        name: "아몬드",
        imgUrl: "https://cdn.zamfit.kr/event/294.png",
        nutrients: ["단백질", "탄수", "지방"]),
    Food(
        id: 1,
        name: "아몬드",
        imgUrl: "https://cdn.zamfit.kr/event/294.png",
        nutrients: ["단백질", "탄수", "지방"]),
  ].obs;
}
