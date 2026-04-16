import 'package:flutter/material.dart';
import 'package:random_user/model.dart';
import 'package:random_user/service.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _service = UserService();

  User? user;
  bool isLoading = false;
  String? errorMessage;

  UserViewModel();

  Future<void> getRandomUser() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      user = await _service.fetchUser();
    } catch (e) {
      errorMessage = 'Something went wrong: ${e}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
