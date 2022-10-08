import 'package:chat_app/domain/models/user/user.dart';

abstract class UserGateway {
  Future<List<User>> getUsers();
  User getLoggedUser();
}
