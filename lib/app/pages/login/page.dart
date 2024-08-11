import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juction/app/core/theme/global_text_styles.dart';
import 'package:juction/app/pages/login/controller.dart';
import 'package:juction/resources/resources.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Svgs.fulloonColor),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffc4c4c4),
                    borderRadius: BorderRadius.circular(33.5),
                  ),
                  child: TextField(
                    controller: controller.emailController,
                    cursorColor: Colors.white,
                    style: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(24),
                      hintText: "Enter your Email",
                      hintStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                      labelStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33.5),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text("Password", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffc4c4c4),
                        borderRadius: BorderRadius.circular(33.5),
                      ),
                      child: TextField(
                        controller: controller.passwordController,
                        cursorColor: Colors.white,
                        style: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(24),
                          hintText: "Enter your Password",
                          hintStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                          labelStyle: PickItTextTheme.bodyBD16Medium.copyWith(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33.5),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33.5),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            // Login and Sign Up Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("Login", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xff383232))),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("Sign Up", style: PickItTextTheme.bodyBD16Medium.copyWith(color: const Color(0xffFFC700))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
