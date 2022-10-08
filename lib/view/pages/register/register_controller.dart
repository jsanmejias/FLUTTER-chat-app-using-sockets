import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/domain/common/use_cases/socket_connection_use_case.dart';
import 'package:chat_app/domain/use_cases/login_response/user_authentication_use_case.dart';

import 'package:chat_app/infraestructure/driven_adapter/login_response_api/login_response_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/common/socket_connection.dart';

import 'package:chat_app/config/routes/app_routes.dart';

import 'package:chat_app/view/helpers/alerts/ok_alert.dart';

class RegisterController extends GetxController {
  final UserAuthenticationUseCase _userAuthenticationUseCase =
      UserAuthenticationUseCase(loginResponseGateway: LoginResponseApi());
  final SocketConnectionUseCase _updateSocketConnectionUseCase =
      SocketConnectionUseCase(
          socketConnectionGateWay: SocketConnection());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  dynamic Function()? runUserRegistration(BuildContext context) {
    bool isUserAuthenticating =
        _userAuthenticationUseCase.checkIfUserIsAuthenticating();

    if (!isUserAuthenticating) {
      return () async {
        FocusManager.instance.primaryFocus?.unfocus();
        final loginOk = await userRegistration();
        // ignore: use_build_context_synchronously
        connectoToSocket(context, loginOk);
      };
    }

    return null;
  }

  Future<bool> userRegistration() async {
    return await _userAuthenticationUseCase.register(
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  connectoToSocket(BuildContext context, bool loginOk) {
    if (!loginOk) {
      return okAlert(context, 'Wrong Register', 'Check your credentials');
    }
    _updateSocketConnectionUseCase.connectSocket();
    Get.offAndToNamed(AppRoutes.users);
  }
}
