import 'package:get/get.dart';

import 'package:chat_app/domain/use_cases/login_response/user_authentication_use_case.dart';
import 'package:chat_app/domain/common/use_cases/socket_connection_use_case.dart';

import 'package:chat_app/infraestructure/driven_adapter/login_response_api/login_response_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/common/socket_connection.dart';

import 'package:chat_app/config/routes/app_routes.dart';

class LoadingController extends GetxController {
  final UserAuthenticationUseCase _userAuthenticationUseCase =
      UserAuthenticationUseCase(loginResponseGateway: LoginResponseApi());

  final SocketConnectionUseCase _updateSocketConnectionUseCase =
      SocketConnectionUseCase(socketConnectionGateWay: SocketConnection());

  Future<void> checkUserAuthenticationState() async {
    await 1.seconds.delay();
    final bool isUserAuthenticated =
        await _userAuthenticationUseCase.isUserAuthenticated();

    if (!isUserAuthenticated) {
      return Get.offAndToNamed(AppRoutes.login);
    }

    _updateSocketConnectionUseCase.connectSocket();
    Get.offAndToNamed(AppRoutes.users);
  }
}
