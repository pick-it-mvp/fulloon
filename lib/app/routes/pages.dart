import 'package:get/route_manager.dart';
import 'package:juction/app/pages/root/binding.dart';
import 'package:juction/app/pages/root/page.dart';
import 'package:juction/app/pages/search_result/binding.dart';
import 'package:juction/app/pages/search_result/page.dart';
import 'package:juction/app/routes/route.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.root, page: () => const RootPage(), binding: RootPageBinding()),
    GetPage(name: Routes.result, page: () => const SearchResultScreen(), binding: SearchResultBinding()),
  ];
}
