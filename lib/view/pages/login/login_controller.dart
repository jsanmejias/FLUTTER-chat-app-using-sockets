import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/domain/common/use_cases/socket_connection_use_case.dart';
import 'package:chat_app/domain/use_cases/login_response/user_authentication_use_case.dart';

import 'package:chat_app/infraestructure/driven_adapter/login_response_api/login_response_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/common/socket_connection.dart';

import 'package:chat_app/config/routes/app_routes.dart';

import 'package:chat_app/view/helpers/alerts/ok_alert.dart';

class LoginController extends GetxController {
  final UserAuthenticationUseCase _userAuthenticationUseCase =
      UserAuthenticationUseCase(loginResponseGateway: LoginResponseApi());
  final SocketConnectionUseCase _socketConnectionUseCase =
      SocketConnectionUseCase(
          socketConnectionGateWay: SocketConnection());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  dynamic Function()? runUserLogin(BuildContext context) {
    bool isUserAuthenticating =
        _userAuthenticationUseCase.checkIfUserIsAuthenticating();

    if (!isUserAuthenticating) {
      return () async {
        FocusManager.instance.primaryFocus?.unfocus();
        final loginOk = await userLogin();
        connectToSocket(context, loginOk);
      };
    }

    return null;
  }

  Future<bool> userLogin() async {
    return await _userAuthenticationUseCase.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  connectToSocket(BuildContext context, bool loginOk) {
    if (!loginOk) {
      return okAlert(context, 'Wrong Login ', 'Check your credentials');
    }
    _socketConnectionUseCase.connectSocket();
    Get.offAndToNamed(AppRoutes.users);
  }
}
