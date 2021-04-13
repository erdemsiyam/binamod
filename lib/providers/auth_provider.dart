import 'package:flutter/material.dart';

enum AuthState { LOGIN, DONE }

class AuthProvider with ChangeNotifier {
  AuthState _authState = AuthState.LOGIN;
  set authState(val) {
    if (val != _authState) {
      _authState = val;
      notifyListeners();
    }
  }

  get authState => _authState;
}
