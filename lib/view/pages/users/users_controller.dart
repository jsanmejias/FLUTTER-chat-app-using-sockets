import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_app/config/routes/app_routes.dart';

import 'package:chat_app/domain/common/use_cases/socket_connection_use_case.dart';
import 'package:chat_app/domain/use_cases/user/get_users_use_case.dart';
import 'package:chat_app/domain/use_cases/message/get_messages_use_case.dart';
import 'package:chat_app/domain/models/user/user.dart';

import 'package:chat_app/infraestructure/driven_adapter/common/socket_connection.dart';
import 'package:chat_app/infraestructure/driven_adapter/user/user_service_api.dart';
import 'package:chat_app/infraestructure/driven_adapter/message/message_service_api.dart';
import 'package:chat_app/infraestructure/services/api/auth_service.dart';

class UsersController extends GetxController {
  final GetUsersUseCase _getUsersUseCase =
      GetUsersUseCase(userGateway: UserServiceApi());

  final SocketConnectionUseCase _socketConnectionUseCase =
      SocketConnectionUseCase(socketConnectionGateWay: SocketConnection());

  final GetMessagesUseCase _getMessagesUseCase =
      GetMessagesUseCase(messageGateway: MessageServiceApi());

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  List<User> users = [];

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() async {
    users = await _getUsersUseCase.getUsers();
    update();
  }

  loadUsers() async {
    users = await _getUsersUseCase.getUsers();
    refreshController.refreshCompleted();
    update();
  }

  String getLoggedUserName() {
    return _getUsersUseCase.getLoggedUser().name;
  }

  String getLoggedUserEmail(){
    return _getUsersUseCase.getLoggedUser().email;
  }

  void logOut() {
    _socketConnectionUseCase.disconnectSocket();
    Get.offAndToNamed(AppRoutes.login);
    AuthService.deleteToken();
    
  }

  String getServerStatus() {
    return _socketConnectionUseCase.getServerStatus();
  }

  void goToChat(User user) {
    _getMessagesUseCase.setUserTo(user);
    Get.toNamed(AppRoutes.chat);
  }
}
