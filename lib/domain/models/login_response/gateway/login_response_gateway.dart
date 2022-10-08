import 'package:chat_app/domain/models/user/user.dart';

abstract class LoginResponseGateway{
  User getLoggedUser();
  Future<bool> isUserAuthenticated();
  Future<bool> login(String email, String password);
  Future<bool> register(String name, String email, String password);
  bool checkIfUserIsAuthenticating();
}