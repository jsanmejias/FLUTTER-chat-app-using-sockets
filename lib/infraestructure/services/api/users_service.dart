import 'package:http/http.dart' as http;

import 'package:chat_app/domain/models/user/user.dart';
import 'package:chat_app/domain/models/common/users_response.dart';
import 'package:chat_app/infraestructure/services/api/auth_service.dart';

import 'package:chat_app/config/global/environment.dart';

class UsersService {
  Future<List<User>> getUsers({int? from}) async {
    final url = Uri.parse('${Environment.apiUrl}/users');

    try {
      final res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        },
      );

      final usersResponse = usersResponseFromJson(res.body);

      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
