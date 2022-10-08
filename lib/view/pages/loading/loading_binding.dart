import 'package:get/get.dart';

import 'package:chat_app/infraestructure/services/api/auth_service.dart';
import 'package:chat_app/infraestructure/services/socket/socket_service.dart';
import 'package:chat_app/view/pages/loading/loading_controller.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => SocketService());
  }
}
