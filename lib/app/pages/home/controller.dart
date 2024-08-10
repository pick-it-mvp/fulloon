import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/global_logger.dart';
import 'package:juction/app/core/util/jwt_decoder.dart';
import 'package:juction/app/data/provider/pickit_rest_api_client.dart';
import 'package:juction/app/data/service/auth/service.dart';

import '../../../resources/resources.dart';
import '../../data/models/search/search.dart';
import '../../routes/route.dart';

enum Category {
  menu("School food", Svgs.forkKnife, 1),
  snack("Snack", Svgs.cookie, 2),
  produce("Produce", Svgs.carrot, 3),
  meat("Meat", Svgs.lovely, 4),
  fish("Fish", Svgs.fish, 5),
  meal("Meal", Svgs.breadSlice, 6),
  cheese("Milk", Svgs.cheese, 7),
  ramen("Ramen", Svgs.bowlHot, 8),
  iceCream("Ice Cream", Svgs.iceCream, 9),
  beverage("Beverage", Svgs.martiniGlass, 10);

  const Category(this.name, this.iconUrl, this.id);

  final String name;
  final String iconUrl;
  final int id;
}

class HomePageController extends GetxController with StateMixin {
  static HomePageController get to =>
      Get.find<HomePageController>(); // add this line

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  final Rx<String> searchKeyword = "".obs;

  final AuthService authService = Get.find<AuthService>();
  final RestApiClient restApiClient = RestApiClient();

  Rx<bool> isSearching = false.obs;

  bool get isTyping => searchKeyword.value.isNotEmpty;

  Rx<List<Search>> searchHistories = Rx<List<Search>>([]);
  Rx<List<Search>> searchKeywords = Rx<List<Search>>([]);
  Rx<List<Map>> searchResults = Rx<List<Map>>([]);

  void getSearchResult(int? index) async {
    if (index == null && searchKeywords.value.isNotEmpty) {
      Get.toNamed(Routes.result, arguments: {"id": searchKeywords.value[0].id});
    } else {
      //TODO: 404 page 예외 화면으로 이동
    }
  }

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() async {
      isSearching.value = focusNode.hasFocus;
      Log.d("isSearching: ${isSearching.value}");
      if (isSearching.value) {
        final result = parseJwtPayLoad(authService.accessToken!)["id"];
        searchHistories.value = await restApiClient.getSearchHistory(result);
      }
    });

    textEditingController.addListener(() async {
      searchKeyword.value = textEditingController.text;
      if (searchKeyword.value.isNotEmpty) {
        searchKeywords.value =
            await restApiClient.getSearchKeyword(textEditingController.text);
      }
    });
  }

  void clearSearchKeyword() {
    textEditingController.clear();
    searchKeyword.value = "";
    searchKeywords.value.clear();
  }

  void deleteSearchHistory(int id) async {
    await restApiClient.deleteSearchHistory(id);
    searchHistories.value.removeWhere((element) => element.id == id);
    searchHistories.refresh();
  }
}
