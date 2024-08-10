import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/global_logger.dart';
import 'package:juction/app/core/util/jwt_decoder.dart';
import 'package:juction/app/data/provider/pickit_rest_api_client.dart';
import 'package:juction/app/data/service/auth/service.dart';

import '../../../resources/resources.dart';
import '../../routes/route.dart';

enum Category {
  menu("School food", Svgs.forkKnife),
  snack("Snack", Svgs.cookie),
  produce("Produce", Svgs.carrot),
  meat("Meat", Svgs.lovely),
  fish("Fish", Svgs.fish),
  meal("Meal", Svgs.breadSlice),
  cheese("Milk", Svgs.cheese),
  ramen("Ramen", Svgs.bowlHot),
  iceCream("Ice Cream", Svgs.iceCream),
  beverage("Beverage", Svgs.martiniGlass);

  const Category(this.name, this.iconUrl);

  final String name;
  final String iconUrl;
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

  Rx<List<Map>> searchHistories = Rx<List<Map>>([]);
  Rx<List<Map>> searchKeywords = Rx<List<Map>>([]);
  Rx<List<Map>> searchResults = Rx<List<Map>>([]);

  void getSearchResult(int? index) async {
    Get.toNamed(Routes.result, arguments: {
      "id": index == null
          ? searchKeyword.value
          : searchKeywords.value[index - 1]["id"]
    });
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
    searchHistories.value.removeWhere((element) => element["id"] == id);
    searchHistories.refresh();
  }
}
