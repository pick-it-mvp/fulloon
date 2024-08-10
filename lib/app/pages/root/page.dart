// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/pages/root/controller.dart';

class RootPage extends GetView<RootPageController> {
  const RootPage({super.key});

  BottomNavigationBarItem _bottomNavItem(String imageUrl, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/$imageUrl.svg",
          color: PickItColors.primaryColor,
        ),
        activeIcon: SvgPicture.asset("assets/svgs/${imageUrl}_fill.svg", color: PickItColors.primaryColor),
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex, children: controller.pages),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: controller.pageIndex,
            onTap: controller.changePage,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            fixedColor: PickItColors.primaryColor,
            unselectedItemColor: PickItColors.primaryColor,
            items: [
              _bottomNavItem("home", "Home"),
              _bottomNavItem("chat", "Question"),
              _bottomNavItem("my", "My"),
            ],
          ),
        );
      }),
    );
  }
}
