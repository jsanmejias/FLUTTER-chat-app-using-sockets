import 'package:get/get.dart';

import 'package:chat_app/domain/models/user/gateway/user_gateway.dart';
import 'package:chat_app/domain/models/user/user.dart';

import 'package:chat_app/infraestructure/services/api/auth_service.dart';
import 'package:chat_app/infraestructure/services/api/users_service.dart';


class UserServiceApi implements UserGateway {
  final usersService = UsersService();
  AuthService authService = Get.find();
  @override
  Future<List<User>> getUsers() {
    return usersService.getUsers();
  }

  @override
  User getLoggedUser() {
    return authService.user;
  }
}
