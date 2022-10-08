import 'package:chat_app/domain/models/user/gateway/user_gateway.dart';
import 'package:chat_app/domain/models/user/user.dart';

class GetUsersUseCase {
  final UserGateway userGateway;

  GetUsersUseCase({required this.userGateway});

  Future<List<User>> getUsers() async{
    return userGateway.getUsers();
  }

  User getLoggedUser(){
    return userGateway.getLoggedUser();
  }
}