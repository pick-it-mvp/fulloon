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
  snack("Snack", Svgs.cookie, 10),
  produce("Produce", Svgs.carrot, 2),
  meat("Meat", Svgs.lovely, 3),
  fish("Fish", Svgs.fish, 4),
  meal("Meal", Svgs.breadSlice, 5),
  cheese("Milk", Svgs.cheese, 6),
  ramen("Instant", Svgs.bowlHot, 7),
  iceCream("Ice Cream", Svgs.iceCream, 8),
  beverage("Beverage", Svgs.martiniGlass, 9);

  const Category(this.name, this.iconUrl, this.id);

  final String name;
  final String iconUrl;
  final int id;
}

class HomePageController extends GetxController with StateMixin {
  static HomePageController get to => Get.find<HomePageController>(); // add this line

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  final Rx<String> searchKeyword = "".obs;

  final AuthService authService = Get.find<AuthService>();
  final RestApiClient restApiClient = RestApiClient();

  Rx<bool> isSearching = false.obs;

  bool get isTyping => searchKeyword.value.isNotEmpty;

  Rx<List<Map>> searchHistories = Rx<List<Map>>([]);
  Rx<List<Search>> searchKeywords = Rx<List<Search>>([]);
  Rx<List<Map>> searchResults = Rx<List<Map>>([]);

  Future<void> getSearchResult(int? index, bool isKeywordId) async {
    if (isKeywordId) {
      Get.toNamed(Routes.result, arguments: {"id": index});
    }
    if (index != null) {
      Get.toNamed(Routes.result, arguments: {"id": index});
    } else if (searchKeywords.value.isNotEmpty) {
      Get.toNamed(Routes.result, arguments: {"id": searchKeywords.value[0].id});
    } else {
      //TODO: 404 page 예외 화면으로 이동
    }
  }

  bool isLoading = false;

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
      await getKeywords();
    });
  }

  Future<void> getKeywords() async {
    searchKeyword.value = textEditingController.text;

    if (searchKeyword.value.isNotEmpty && !isLoading) {
      isLoading = true;

      searchKeywords.value = await restApiClient.getSearchKeyword(searchKeyword.value);
      isLoading = false;
    }
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
