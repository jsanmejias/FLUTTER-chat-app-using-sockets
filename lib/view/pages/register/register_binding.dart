import 'package:get/get.dart';

import 'package:chat_app/view/pages/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
