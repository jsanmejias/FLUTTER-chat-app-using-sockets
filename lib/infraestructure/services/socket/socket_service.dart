// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart';

import 'package:chat_app/infraestructure/services/api/auth_service.dart';

import 'package:chat_app/config/global/environment.dart';

// enum ServerStatus { Online, Offline, Connecting }

class SocketService extends GetxController {
  // late ServerStatus _serverStatus = ServerStatus.Connecting;
  late RxString _serverStatus = "Connecting".obs;
  late Socket _socket;

  String get serverStatus => _serverStatus.value;
  Socket get socket => _socket;

  Function get emit => _socket.emit;

  void connect() async {
    final token = await AuthService.getToken();

    // This dart client for Flutter
    //Environment.socketUrl
    //'https://flutter-chat-backend-doc-doc.herokuapp.com/'
    _socket = io(
        Environment.socketUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableForceNew()
            .setExtraHeaders({
              'x-token': token,
            })
            .build());

    //Use _socket connect for when you use disableAutoConnect()
    //_socket.connect();

    _socket.onConnect((_) {
      _serverStatus.value = "Online";
      update();
    });
    _socket.onDisconnect((_) {
      _serverStatus.value = "Offline";
      update();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}





// class SocketService with ChangeNotifier {
//   late ServerStatus _serverStatus = ServerStatus.Connecting;
//   late Socket _socket;

//   ServerStatus get serverStatus => _serverStatus;
//   Socket get socket => _socket;

//   Function get emit => _socket.emit;

//   void connect() async {
//     final token = await AuthService.getToken();
  
//     // This dart client for Flutter
//     //Environment.socketUrl
//     //'https://flutter-chat-backend-doc-doc.herokuapp.com/'
//     _socket = io(
//         Environment.socketUrl,
//         OptionBuilder()
//             .setTransports(['websocket'])
//             .enableAutoConnect()
//             .enableForceNew()
//             .setExtraHeaders({
//               'x-token': token,
//             })
//             .build());

//     //Use _socket connect for when you use disableAutoConnect()
//     //_socket.connect();

//     _socket.onConnect((_) {
//       _serverStatus = ServerStatus.Online;
//       notifyListeners();
//     });
//     _socket.onDisconnect((_) {
//       _serverStatus = ServerStatus.Offline;
//       notifyListeners();
//     });
//   }

//   void disconnect() {
//     _socket.disconnect();
//   }
// }
