import 'package:get/get.dart';
import 'package:juction/app/data/models/food/food_preview.dart';
import 'package:juction/app/data/provider/pickit_rest_api_client.dart';
import 'package:juction/app/pages/home/controller.dart';

class CategorySelectController extends GetxController with StateMixin {
  static CategorySelectController get to =>
      Get.find<CategorySelectController>(); // add this line
  final Category category = Get.arguments ?? 0;
  final RxList<FoodPreview> categories = <FoodPreview>[].obs;
  final restApiClient = RestApiClient();
  final RxBool isLoading = false.obs;

  void getCategoryItems() async {
    isLoading.value = true;

    var result = await restApiClient.getCategories(category.id);
    categories.value = result;

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryItems();
  }
}
