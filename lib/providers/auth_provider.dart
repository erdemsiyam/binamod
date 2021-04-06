import 'package:flutter/material.dart';

enum AuthEnum { NOT, DONE }

class AuthProvider with ChangeNotifier {
  AuthEnum authEnum = AuthEnum.NOT;

  login_done() {
    authEnum = AuthEnum.DONE;
    notifyListeners();
  }
}
