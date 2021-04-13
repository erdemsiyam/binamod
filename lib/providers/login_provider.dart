import 'package:flutter/material.dart';

enum LoginState { INIT, LOADING, WRONG_PASSWORD, SERVER_ERROR, DONE }

class LoginProvider with ChangeNotifier {
  LoginState _loginState = LoginState.INIT;
  set loginState(val) {
    if (val != _loginState) {
      _loginState = val;
      notifyListeners();
    }
  }

  get loginState => _loginState;

  Future<bool> login() async {
    //   loginEnum = LoginEnum.LOADING;
    //   notifyListeners();
    //   switch ((await UserService()
    //           .login(UserRequestModel(username: '', password: '')))
    //       .httpStatus) {
    //     case 200:
    //       loginEnum = LoginEnum.DONE;
    //       notifyListeners();
    //       return true;
    //     case 400:
    //     case 401:
    //     case 402:
    //       loginEnum = LoginEnum.WRONG_PASSWORD;
    //       notifyListeners();
    //       return false;
    //     case 404:
    //     case 500:
    //       loginEnum = LoginEnum.SERVER_ERROR;
    //       notifyListeners();
    //       return false;
    //   }
    // TODO yapılmalı
    return true;
  }
}
