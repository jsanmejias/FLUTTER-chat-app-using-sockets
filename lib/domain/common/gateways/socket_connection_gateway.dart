import 'package:socket_io_client/socket_io_client.dart';

abstract class SocketConnectionGateWay {
  String getServerStatus();
  Socket getSocket();
  Function getEmit();
  void connectSocket();
  void disconnectSocket();
}
