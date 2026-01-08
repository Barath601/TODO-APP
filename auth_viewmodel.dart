import 'package:flutter/material.dart';
import 'package:todo_app/services/auth_services.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;

  Future<bool> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authService.login(email, password);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authService.register(email, password);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
