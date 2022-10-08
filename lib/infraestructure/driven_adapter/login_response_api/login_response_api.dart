import 'package:get/get.dart';

import 'package:chat_app/domain/models/user/user.dart';
import 'package:chat_app/domain/models/login_response/gateway/login_response_gateway.dart';

import 'package:chat_app/infraestructure/services/api/auth_service.dart';

class LoginResponseApi implements LoginResponseGateway {
  AuthService authService = Get.find();

  @override
  User getLoggedUser() {
    return authService.user;
  }

  @override
  Future<bool> isUserAuthenticated() async {
    // // implementar el método por api rest que verifique si hay un usuario loggeado
    return await authService.isUserAuthenticated();
  }

  @override
  Future<bool> login(String email, String password) async {
    return await authService.login(email, password);
  }

  @override
  Future<bool> register(String name, String email, String password) async {
    return await authService.register(name, email, password);
  }

  @override
  bool checkIfUserIsAuthenticating() {
    return authService.authenticating;
  }
}
