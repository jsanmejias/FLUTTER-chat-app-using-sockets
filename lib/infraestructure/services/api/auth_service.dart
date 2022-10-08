import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat_app/config/global/environment.dart';
import 'package:chat_app/domain/models/login_response/login_response.dart';
import 'package:chat_app/domain/models/user/user.dart';

class AuthService extends GetxController {
  late User user;

  final RxBool _authenticating = false.obs;

  final _storage = const FlutterSecureStorage();

  bool get authenticating => _authenticating.value;
  set authenticating(bool value) {
    _authenticating.value = value;
  }

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token!;
  }

  static Future deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    authenticating = true;

    final data = {'email': email, 'password': password};
    final url = Uri.parse('${Environment.apiUrl}/login');

    final res = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    authenticating = false;

    print(res.body);

    if (res.statusCode != 200) return false;

    final LoginResponse loginResponse = loginResponseFromJson(res.body);
    user = loginResponse.user;

    await _saveToken(loginResponse.token);

    return true;
  }

  Future<bool> register(String name, String email, String password) async {
    authenticating = true;

    final data = {'name': name, 'email': email, 'password': password};
    final url = Uri.parse('${Environment.apiUrl}/login/new');

    final res = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    authenticating = false;

    print(res.body);

    if (res.statusCode != 200) return false;

    final LoginResponse loginResponse = loginResponseFromJson(res.body);
    user = loginResponse.user;

    await _saveToken(loginResponse.token);

    return true;
  }

  Future<bool> isUserAuthenticated() async {
    final token = await _storage.read(key: 'token') ?? '';
    print('token');
    print(token);

    final url = Uri.parse('${Environment.apiUrl}/login/renew');

    final res = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      },
    );

    print(res.body);
    print(res.statusCode);

    if (res.statusCode != 200) {
      await logout();
      return false;
    }

    try {
      final loginResponse = loginResponseFromJson(res.body);

      user = loginResponse.user;
      print(jsonEncode(user));
      await _saveToken(loginResponse.token);
    } catch (error) {
      printError();
      await logout();
      return false;
    }

    return true;
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}








// class AuthService with ChangeNotifier {
//   late User user;
//   bool _authenticating = false;

//   final _storage = const FlutterSecureStorage();

//   IsLoggedUseCase isLoggedUseCase =
//       IsLoggedUseCase(loginResponseGateway: LoginResponseApi());

//   static FlutterSecureStorage getStorage() {
//     const storage = FlutterSecureStorage();
//     return storage;
//   }

//   bool get authenticating => _authenticating;
//   set authenticating(bool value) {
//     _authenticating = value;
//     notifyListeners();
//   }

//   static Future<String> getToken() async {
//     final storage = FlutterSecureStorage();
//     final token = await storage.read(key: 'token');
//     return token!;
//   }

//   static Future deleteToken() async {
//     final storage = FlutterSecureStorage();
//     await storage.delete(key: 'token');
//   }

//   Future<bool> login(String email, String password) async {
//     authenticating = true;

//     final data = {'email': email, 'password': password};
//     final url = Uri.parse('${Environment.apiUrl}/login');

//     final res = await http.post(
//       url,
//       body: jsonEncode(data),
//       headers: {'Content-Type': 'application/json'},
//     );

//     authenticating = false;

//     print(res.body);

//     if (res.statusCode != 200) return false;

//     final LoginResponse loginResponse = loginResponseFromJson(res.body);
//     user = loginResponse.user;

//     await _saveToken(loginResponse.token);

//     return true;
//   }

//   Future<bool> register(String name, String email, String password) async {
//     authenticating = true;

//     final data = {'name': name, 'email': email, 'password': password};
//     final url = Uri.parse('${Environment.apiUrl}/login/new');

//     final res = await http.post(
//       url,
//       body: jsonEncode(data),
//       headers: {'Content-Type': 'application/json'},
//     );

//     authenticating = false;

//     print(res.body);

//     if (res.statusCode != 200) return false;

//     final LoginResponse loginResponse = loginResponseFromJson(res.body);
//     user = loginResponse.user;

//     await _saveToken(loginResponse.token);

//     return true;
//   }

//   Future<bool> isLoggedIn() async {
//     final token = await _storage.read(key: 'token') ?? '';

//     final url = Uri.parse('${Environment.apiUrl}/login/renew');

//     final res = await http.get(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'x-token': token,
//       },
//     );

//     print(res.body);

//     if (res.statusCode != 200) {
//       await logout();
//       return false;
//     }

//     final loginResponse = loginResponseFromJson(res.body);

//     user = loginResponse.user;

//     await _saveToken(loginResponse.token);

//     return true;
//   }

//   Future _saveToken(String token) async {
//     return await _storage.write(key: 'token', value: token);
//   }

//   // Future logout() async {
//   //   await _storage.delete(key: 'token');
//   // }

//   static Future logout() async {
//     await getStorage().delete(key: 'token');
//   }
// }



