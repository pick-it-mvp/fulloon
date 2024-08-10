import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/data/initalize.dart';
import 'package:juction/app/pages/root/binding.dart';
import 'package:juction/app/pages/search_result/binding.dart';
import 'package:juction/app/routes/pages.dart';
import 'package:juction/app/routes/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitalizer().init();

  /// .env 파일 로딩
  runApp(const PickItApp());
}

class PickItApp extends StatelessWidget {
  const PickItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 760),
      builder: (context, __) => GetMaterialApp(
        title: 'PickIt',
        getPages: AppPages.pages,
        theme: ThemeData(
          useMaterial3: false,
          // fontFamily: 'SpoqaHanSansNeo',
          primaryColor: PickItColors.cFFFFFF,
        ),
        supportedLocales: const [
          Locale('ko', 'KR'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.root,
        initialBinding: RootPageBinding(),
        smartManagement: SmartManagement.full,
        navigatorKey: Get.key,
      ),
    );
  }
}
