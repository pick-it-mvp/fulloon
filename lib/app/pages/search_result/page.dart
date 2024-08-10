import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'item_list_view.dart';

class SearchResultScreen extends GetView<SearchResultController> {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => PickItItemListView(
            title: "베이컨은 철분,엽산이 부족한 식품이에요\n이런 식품은 어떠세요?",
            foods: controller.foods.value,
          ),
        ),
      ),
    );
  }
}
