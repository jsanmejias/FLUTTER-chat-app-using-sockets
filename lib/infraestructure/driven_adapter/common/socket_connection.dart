import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:chat_app/domain/common/gateways/socket_connection_gateway.dart';

import 'package:chat_app/infraestructure/services/socket/socket_service.dart';



class SocketConnection implements SocketConnectionGateWay {
  SocketService socketService = Get.find();

  @override
  String getServerStatus() {
    return socketService.serverStatus;
  }

  @override
  Socket getSocket() {
    return socketService.socket;
  }

  @override
  Function getEmit() {
    return socketService.emit;
  }

  @override
  void connectSocket() {
    return socketService.connect();
  }

  @override
  void disconnectSocket() {
    return socketService.disconnect();
  }
}
