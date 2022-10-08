import 'package:chat_app/domain/common/gateways/socket_connection_gateway.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketConnectionUseCase {
  final SocketConnectionGateWay socketConnectionGateWay;

  SocketConnectionUseCase({required this.socketConnectionGateWay});

  String getServerStatus() {
    return socketConnectionGateWay.getServerStatus();
  }

  Socket getSocket() {
    return socketConnectionGateWay.getSocket();
  }

  Function getEmit(){
    return socketConnectionGateWay.getEmit();
  }

  void connectSocket() {
    return socketConnectionGateWay.connectSocket();
  }

  void disconnectSocket() {
    return socketConnectionGateWay.disconnectSocket();
  }
}
