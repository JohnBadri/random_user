import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_user/model.dart';

class UserService {
  Future<User> fetchUser() async {
    final uri = Uri.https(
      'randomuser.me',
      'api',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to obtain random user data');
    }
  }
}
