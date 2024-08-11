import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juction/app/data/provider/pickit_rest_api_client.dart';
import 'package:juction/app/pages/onboarding/view/birth.dart';
import 'package:juction/app/pages/onboarding/view/gender.dart';
import 'package:juction/app/routes/route.dart';

class OnboardingPageController extends GetxController with StateMixin {
  static OnboardingPageController get to => Get.find<OnboardingPageController>(); // add this line

  final Rx<int> currentPage = 0.obs;
  final List pages = ["Name", "Email", "Password", "PasswordCheck", "Nickname", "Next"];

  final RestApiClient restApiClient = RestApiClient();

  String get currentPageName => pages[currentPage.value];
  String get subPageName => pages[currentPage.value + 1];

  Rx<String> name = "".obs;
  Rx<String> email = "".obs;
  Rx<String> password = "".obs;
  Rx<String> passwordCheck = "".obs;

  Rx<String> phoneNumber = "".obs;
  Rx<String> validationNumber = "".obs;
  Rx<String> nickname = "".obs;

  Rx<String> gender = "".obs;
  Rx<bool?> isBirth = Rx(null);

  Rx<DateTime> birthDay = DateTime.now().obs;

  Rx<int> year = 0.obs;
  Rx<int> month = 0.obs;
  Rx<int> day = 0.obs;

  bool get birth {
    if (isBirth.value == null) {
      return false;
    } else {
      if (isBirth.value == true) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool get notBirth {
    if (isBirth.value == null) {
      return false;
    } else {
      if (isBirth.value == false) {
        return true;
      } else {
        return false;
      }
    }
  }

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController subTextEditingController = TextEditingController();

  void nextPage() {
    switch (currentPage.value) {
      case 0:
        if (textEditingController.text.isEmpty) {
          Get.snackbar("이름을 입력해주세요", "이름을 입력해주세요");
          return;
        }
        name.value = textEditingController.text;
        textEditingController.clear();
        break;
      case 1:
        if (textEditingController.text.isEmpty) {
          Get.snackbar("아이디를 입력해주세요", "아이디를 입력해주세요");
          return;
        }
        email.value = textEditingController.text;
        textEditingController.clear();
        break;
      case 2:
        if (textEditingController.text.isEmpty) {
          Get.snackbar("비밀번호를 입력해주세요", "비밀번호를 입력해주세요");
          return;
        }

        if (textEditingController.text.isEmpty) {
          Get.snackbar("비밀번호 확인을 입력해주세요", "비밀번호 확인을 입력해주세요");
          return;
        }
        passwordCheck.value = textEditingController.text;
        textEditingController.clear();
        password.value = textEditingController.text;
        textEditingController.clear();
        break;

      case 4:
        if (textEditingController.text.isEmpty) {
          Get.snackbar("닉네임을 입력해주세요", "닉네임을 입력해주세요");
          return;
        }
        nickname.value = textEditingController.text;
        textEditingController.clear();
        break;
    }
    if (currentPage.value == 2) {
      currentPage.value += 2;
    } else {
      currentPage.value++;
    }
    if (currentPage.value == 5) {
      Get.to(() => const GenderPage());
    }
  }

  void nextPage2(String data) {
    if (data == "Man") {
      gender.value = "m";
    } else {
      gender.value = "f";
      Get.to(() => const BirthPage());
    }
  }

  void nextPage3(String data) {
    if (data == "Yes") {
      isBirth.value = true;
    } else {
      isBirth.value = false;
    }
  }

  void selectYear(int year) {
    this.year.value = year;
  }

  void selectMonth(int month) {
    this.month.value = month;
  }

  void selectDay(int day) {
    this.day.value = day;
  }

  void signUp() async {
    String userMode = birth ? "embryo" : "baby";

    DateTime? childBirth = null;
    DateTime? dueDate = null;

    if (birth) {
      log("year: ${year.value}, month: ${month.value}, day: ${day.value}");
      childBirth = DateTime(2000 + year.value, month.value, day.value);
    } else {
      dueDate = DateTime(2000 + year.value, month.value, day.value);
    }

    Map<String, dynamic> data = {
      "name": name.value,
      "email": email.value,
      "password": password.value,
      "nickname": nickname.value,
      "userMode": userMode,
      "gender": gender.value,
      "childBirth": childBirth,
      "dueDate": dueDate
    };

    await restApiClient.registerUser(data);
    Get.offAllNamed(Routes.root);
  }
}
