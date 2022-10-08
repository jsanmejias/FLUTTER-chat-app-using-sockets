import 'package:get/get.dart';

import 'package:chat_app/view/pages/users/users_controller.dart';
import 'package:chat_app/infraestructure/services/api/chat_service.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => ChatService());
  }
}