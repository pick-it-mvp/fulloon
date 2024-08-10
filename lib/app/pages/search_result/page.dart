import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/global_text_util.dart';
import '../../data/models/user.dart';
import '../chat/widget/chat_profile_widget.dart';
import 'controller.dart';
import 'item_list_view.dart';

class SearchResultScreen extends GetView<SearchResultController> {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Obx(
              () => PickItItemListView(
                title: "베이컨은 철분,엽산이 부족한 식품이에요\n이런 식품은 어떠세요?",
                foods: controller.foods.value,
              ),
            ),
            ChatProfileWidget(
              user: User(
                id: "1",
                nickName: "d",
                age: 21,
                childbirth: "2023-11-30",
                dueDate: "2024-08-09",
                userMode: "baby",
                profileImgUrl: GlobalTextUtil.defaultImgUrl,
                region: "seoul",
                registrationDate: "2024-08-09",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
