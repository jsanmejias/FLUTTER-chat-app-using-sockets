import 'package:chat_app/domain/models/login_response/gateway/login_response_gateway.dart';
import 'package:chat_app/domain/models/user/user.dart';

class UserAuthenticationUseCase {
  final LoginResponseGateway loginResponseGateway;

  User getLoggedUser(){
    return loginResponseGateway.getLoggedUser();
  }

  UserAuthenticationUseCase({required this.loginResponseGateway});

  Future<bool> isUserAuthenticated() async {
    return loginResponseGateway.isUserAuthenticated();
  }

  Future<bool> login(String email, String password) async {
    return loginResponseGateway.login(email, password);
  }

  Future<bool> register(String name, String email, String password) async {
    return loginResponseGateway.register(name, email, password);
  }

  bool checkIfUserIsAuthenticating() {
    return loginResponseGateway.checkIfUserIsAuthenticating();
  }
}
