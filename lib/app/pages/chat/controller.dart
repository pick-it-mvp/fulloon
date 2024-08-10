import 'package:get/get.dart';

import '../../data/models/user.dart';

class ChatController extends GetxController with StateMixin {
  final Rx<User?> user = Rxn(null);

  static ChatController get to => Get.find<ChatController>(); // add this line

  void getChatData() {
    if (user.value != null) {
      user.value = User.fromModel(user.value!);
    }
  }
}
